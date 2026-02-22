import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MarkdownDiagramResolver {
  static const bool _enableDrawio = false;
  static const String _drawioFallbackMarkdown =
      '> Draw.io source hidden (rendering temporarily disabled).';
  static final RegExp _diagramFencePattern = RegExp(
    r'(^|\n)(```|~~~)\s*([A-Za-z0-9_.+-]+)[^\n]*\n([\s\S]*?)\n\2(?=\n|$)',
    multiLine: true,
  );
  static final Map<String, Future<String?>> _inflight =
      <String, Future<String?>>{};
  static const Map<String, String> _drawioExportHeaders = <String, String>{
    'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
    'Accept': 'image/png,image/svg+xml,image/*;q=0.8,*/*;q=0.5',
    'Origin': 'https://app.diagrams.net',
    'Referer': 'https://app.diagrams.net/',
    'User-Agent':
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_6_0) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
  };

  static bool hasDiagramFence(String source) {
    if (source.isEmpty) return false;
    for (final match in _diagramFencePattern.allMatches(source)) {
      final language = (match.group(3) ?? '').trim().toLowerCase();
      final code = (match.group(4) ?? '').trim();
      if (_resolveRequest(language: language, code: code) != null ||
          _isDrawioFence(language: language, code: code)) {
        return true;
      }
    }
    return false;
  }

  static Future<String> resolveMarkdown(
    String source, {
    void Function(String message)? logger,
  }) async {
    if (!hasDiagramFence(source)) return source;

    final matches = _diagramFencePattern
        .allMatches(source)
        .toList(growable: false);
    if (matches.isEmpty) return source;

    final output = StringBuffer();
    var cursor = 0;
    for (final match in matches) {
      output.write(source.substring(cursor, match.start));
      final leading = match.group(1) ?? '';
      final language = (match.group(3) ?? '').trim().toLowerCase();
      final code = (match.group(4) ?? '').trimRight();
      final isDrawioFence = _isDrawioFence(language: language, code: code);
      final request = _resolveRequest(language: language, code: code);
      if (request == null || code.trim().isEmpty) {
        if (isDrawioFence && !_enableDrawio) {
          output
            ..write(leading)
            ..write(_drawioFallbackMarkdown)
            ..write('\n');
          logger?.call('diagramsnet render disabled, fallback markdown used');
        } else {
          output.write(match.group(0)!);
        }
      } else {
        final localUri = await _resolveToLocalImage(
          diagramType: request.diagramType,
          outputFormats: request.outputFormats,
          sourceCode: code,
          logger: logger,
        );
        if (localUri == null) {
          output.write(match.group(0)!);
        } else {
          output
            ..write(leading)
            ..write('![${request.altText}]($localUri)\n');
        }
      }
      cursor = match.end;
    }
    output.write(source.substring(cursor));
    return output.toString();
  }

  static Future<String?> _resolveToLocalImage({
    required String diagramType,
    required List<String> outputFormats,
    required String sourceCode,
    void Function(String message)? logger,
  }) async {
    final hash = md5
        .convert(
          utf8.encode('$diagramType|${outputFormats.join(',')}|$sourceCode'),
        )
        .toString();
    final existing = _inflight[hash];
    if (existing != null) {
      return existing;
    }

    final future = _downloadOrLoadCachedDiagram(
      hash: hash,
      diagramType: diagramType,
      outputFormats: outputFormats,
      sourceCode: sourceCode,
      logger: logger,
    );
    _inflight[hash] = future;
    try {
      return await future;
    } finally {
      if (identical(_inflight[hash], future)) {
        _inflight.remove(hash);
      }
    }
  }

  static Future<String?> _downloadOrLoadCachedDiagram({
    required String hash,
    required String diagramType,
    required List<String> outputFormats,
    required String sourceCode,
    void Function(String message)? logger,
  }) async {
    final root = await getTemporaryDirectory();
    final dir = Directory('${root.path}/markdown_diagrams');
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    Object? lastError;
    for (final outputFormat in outputFormats) {
      final file = File('${dir.path}/${diagramType}_$hash.$outputFormat');
      if (await file.exists()) {
        final size = await file.length();
        if (size > 0) {
          logger?.call('$diagramType cache hit: ${file.path}');
          return file.uri.toString();
        }
      }
      final bytes = await _fetchDiagramBytes(
        diagramType: diagramType,
        outputFormat: outputFormat,
        sourceCode: sourceCode,
        logger: logger,
      );
      if (bytes != null && bytes.isNotEmpty) {
        await file.writeAsBytes(bytes, flush: true);
        logger?.call(
          '$diagramType fetched: ${file.path}, bytes=${bytes.length}',
        );
        return file.uri.toString();
      }
      lastError = 'all providers failed, format=$outputFormat';
    }
    logger?.call('$diagramType fetch failed: $lastError');
    return null;
  }

  static Future<List<int>?> _fetchDiagramBytes({
    required String diagramType,
    required String outputFormat,
    required String sourceCode,
    void Function(String message)? logger,
  }) async {
    final providers = <Future<List<int>?> Function()>[
      () => _fetchFromKroki(
        diagramType: diagramType,
        outputFormat: outputFormat,
        sourceCode: sourceCode,
        logger: logger,
      ),
      if (diagramType == 'diagramsnet')
        () => _fetchFromConvertDrawio(
          outputFormat: outputFormat,
          sourceCode: sourceCode,
          logger: logger,
        ),
    ];
    for (final provider in providers) {
      final bytes = await provider();
      if (bytes != null && bytes.isNotEmpty) {
        return bytes;
      }
    }
    return null;
  }

  static Future<List<int>?> _fetchFromKroki({
    required String diagramType,
    required String outputFormat,
    required String sourceCode,
    void Function(String message)? logger,
  }) async {
    final endpoint = 'https://kroki.io/$diagramType/$outputFormat';
    for (var attempt = 1; attempt <= 2; attempt++) {
      try {
        logger?.call(
          '$diagramType kroki attempt=$attempt format=$outputFormat',
        );
        final response = await http
            .post(
              Uri.parse(endpoint),
              headers: const {'Content-Type': 'text/plain; charset=utf-8'},
              body: sourceCode,
            )
            .timeout(const Duration(seconds: 12));
        if (response.statusCode == 200 &&
            _isValidImageBytes(response.bodyBytes, outputFormat)) {
          return response.bodyBytes;
        }
        logger?.call(
          '$diagramType kroki failed status=${response.statusCode} bytes=${response.bodyBytes.length}',
        );
      } catch (_) {}
    }
    return null;
  }

  static Future<List<int>?> _fetchFromConvertDrawio({
    required String outputFormat,
    required String sourceCode,
    void Function(String message)? logger,
  }) async {
    if (outputFormat != 'png' && outputFormat != 'svg') {
      return null;
    }
    final endpoints = <Uri>[
      Uri.parse('https://convert.diagrams.net/node/export'),
      Uri.parse('https://convert.diagrams.net/export3'),
    ];
    final payloads = <Map<String, String>>[
      <String, String>{
        'format': outputFormat,
        'xml': sourceCode,
        'base64': '0',
        'embedXml': '0',
        'spin': '0',
        'transparent': '1',
      },
      <String, String>{
        'format': outputFormat,
        'xml': sourceCode,
        'base64': '0',
        'embedXml': '0',
        'spin': '0',
        'transparent': '1',
        'crop': '0',
        'border': '16',
      },
      <String, String>{
        'format': outputFormat,
        'xml': sourceCode,
        'base64': '0',
        'embedXml': '0',
        'spin': '0',
        'transparent': '1',
        'crop': '1',
        'border': '16',
      },
    ];
    for (var attempt = 1; attempt <= 1; attempt++) {
      for (final endpoint in endpoints) {
        for (
          var payloadIndex = 0;
          payloadIndex < payloads.length;
          payloadIndex++
        ) {
          final payload = payloads[payloadIndex];
          try {
            logger?.call(
              'diagramsnet convert attempt=$attempt payload=${payloadIndex + 1}/${payloads.length} format=$outputFormat endpoint=$endpoint',
            );
            final response = await http
                .post(endpoint, headers: _drawioExportHeaders, body: payload)
                .timeout(const Duration(seconds: 8));
            if (_isFatalDrawioResponse(response)) {
              logger?.call(
                'diagramsnet convert fatal response, stop retries: status=${response.statusCode}',
              );
              return null;
            }
            if (response.statusCode == 200 &&
                _isValidImageBytes(response.bodyBytes, outputFormat)) {
              if (_isSuspiciousDrawioImage(
                bytes: response.bodyBytes,
                outputFormat: outputFormat,
                sourceCode: sourceCode,
                logger: logger,
              )) {
                continue;
              }
              return response.bodyBytes;
            }
            logger?.call(
              'diagramsnet convert failed status=${response.statusCode} bytes=${response.bodyBytes.length}',
            );
          } catch (error) {
            logger?.call('diagramsnet convert exception: $error');
          }
        }
      }
    }
    return null;
  }

  static bool _isFatalDrawioResponse(http.Response response) {
    if (response.statusCode < 500) return false;
    final text = utf8.decode(response.bodyBytes, allowMalformed: true).trim();
    if (text.isEmpty) return false;
    return text == 'Error!' ||
        text.startsWith('Error') ||
        text.startsWith('<!DOCTYPE');
  }

  static bool _isValidImageBytes(List<int> bytes, String outputFormat) {
    if (bytes.isEmpty) return false;
    if (outputFormat == 'png') {
      if (bytes.length < 8) return false;
      return bytes[0] == 0x89 &&
          bytes[1] == 0x50 &&
          bytes[2] == 0x4E &&
          bytes[3] == 0x47;
    }
    if (outputFormat == 'svg') {
      final text = utf8.decode(bytes, allowMalformed: true).trimLeft();
      return text.startsWith('<svg') || text.startsWith('<?xml');
    }
    return true;
  }

  static bool _isSuspiciousDrawioImage({
    required List<int> bytes,
    required String outputFormat,
    required String sourceCode,
    void Function(String message)? logger,
  }) {
    if (outputFormat != 'png') return false;
    if (bytes.length < 24) return false;
    final dimensions = _parsePngDimensions(bytes);
    if (dimensions == null) return false;
    final (width, height) = dimensions;
    logger?.call(
      'diagramsnet png dimensions=${width}x$height bytes=${bytes.length}',
    );
    final complexSource = sourceCode.length > 900;
    if (!complexSource) return false;
    final tooSmallBySize = bytes.length < 900;
    final tooSmallByDimension = width < 180 || height < 120;
    if (tooSmallBySize || tooSmallByDimension) {
      logger?.call(
        'diagramsnet suspicious small image, retrying fallback params: sourceChars=${sourceCode.length}, width=$width, height=$height, bytes=${bytes.length}',
      );
      return true;
    }
    return false;
  }

  static (int width, int height)? _parsePngDimensions(List<int> bytes) {
    if (bytes.length < 24) return null;
    if (!(bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47)) {
      return null;
    }
    final width =
        (bytes[16] << 24) | (bytes[17] << 16) | (bytes[18] << 8) | bytes[19];
    final height =
        (bytes[20] << 24) | (bytes[21] << 16) | (bytes[22] << 8) | bytes[23];
    if (width <= 0 || height <= 0) return null;
    return (width, height);
  }

  static _DiagramRenderRequest? _resolveRequest({
    required String language,
    required String code,
  }) {
    if (language == 'mermaid') {
      return const _DiagramRenderRequest(
        diagramType: 'mermaid',
        outputFormats: <String>['png'],
        altText: 'Mermaid Diagram',
      );
    }

    if (_isDrawioFence(language: language, code: code)) {
      if (!_enableDrawio) {
        return null;
      }
      return const _DiagramRenderRequest(
        diagramType: 'diagramsnet',
        outputFormats: <String>['png', 'svg'],
        altText: 'Draw.io Diagram',
      );
    }

    return null;
  }

  static bool _isDrawioFence({required String language, required String code}) {
    final isDrawioLanguage =
        language == 'drawio' ||
        language == 'diagramsnet' ||
        language == 'mxgraph' ||
        language == 'draw.io';
    final looksLikeDrawioXml =
        (language == 'xml' || language == 'drawio-xml') &&
        (code.contains('<mxfile') || code.contains('<mxGraphModel'));
    return isDrawioLanguage || looksLikeDrawioXml;
  }
}

class _DiagramRenderRequest {
  final String diagramType;
  final List<String> outputFormats;
  final String altText;

  const _DiagramRenderRequest({
    required this.diagramType,
    required this.outputFormats,
    required this.altText,
  });
}
