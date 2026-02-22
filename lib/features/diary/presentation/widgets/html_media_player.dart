import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HtmlMediaPlayer extends StatefulWidget {
  final String source;
  final bool isVideo;
  final String title;
  final String openLabel;
  final Color bodyTextColor;
  final Color secondaryTextColor;

  const HtmlMediaPlayer({
    super.key,
    required this.source,
    required this.isVideo,
    required this.title,
    required this.openLabel,
    required this.bodyTextColor,
    required this.secondaryTextColor,
  });

  @override
  State<HtmlMediaPlayer> createState() => _HtmlMediaPlayerState();
}

class _HtmlMediaPlayerState extends State<HtmlMediaPlayer> {
  VideoPlayerController? _controller;
  bool _ready = false;
  bool _failed = false;
  bool _initializing = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void didUpdateWidget(covariant HtmlMediaPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source != widget.source ||
        oldWidget.isVideo != widget.isVideo) {
      _disposeController();
      _ready = false;
      _failed = false;
      _initializing = false;
      unawaited(_initController());
    }
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  Future<void> _initController() async {
    final trimmed = widget.source.trim();
    if (trimmed.isEmpty) {
      if (mounted) {
        setState(() {
          _failed = true;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        _initializing = true;
      });
    }

    final controller = _buildController(trimmed);
    if (controller == null) {
      if (mounted) {
        setState(() {
          _initializing = false;
          _failed = true;
        });
      }
      return;
    }

    _controller = controller;
    try {
      await controller.initialize();
      if (!mounted || _controller != controller) {
        await controller.dispose();
        return;
      }
      controller.setLooping(false);
      setState(() {
        _ready = true;
        _failed = false;
        _initializing = false;
      });
    } catch (error) {
      if (!mounted || _controller != controller) {
        return;
      }
      debugPrint('[HtmlMediaPlayer] init failed: $error, source=$trimmed');
      setState(() {
        _ready = false;
        _failed = true;
        _initializing = false;
      });
    }
  }

  VideoPlayerController? _buildController(String source) {
    final uri = Uri.tryParse(source);
    if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) {
      return VideoPlayerController.networkUrl(uri);
    }
    if (uri != null && uri.scheme == 'file') {
      return VideoPlayerController.file(File(uri.toFilePath()));
    }

    final file = File(source);
    if (file.existsSync()) {
      return VideoPlayerController.file(file);
    }
    return VideoPlayerController.asset(source);
  }

  Future<void> _disposeController() async {
    final controller = _controller;
    _controller = null;
    if (controller != null) {
      await controller.dispose();
    }
  }

  Future<void> _togglePlayPause() async {
    final controller = _controller;
    if (!_ready || controller == null) return;
    final value = controller.value;
    if (value.isPlaying) {
      await controller.pause();
      return;
    }
    final position = value.position;
    final duration = value.duration;
    if (duration > Duration.zero && position >= duration) {
      await controller.seekTo(Duration.zero);
    }
    await controller.play();
  }

  Future<void> _seekToFraction(double fraction) async {
    final controller = _controller;
    if (!_ready || controller == null) return;
    final duration = controller.value.duration;
    if (duration <= Duration.zero) return;
    final targetMs = (duration.inMilliseconds * fraction).round();
    await controller.seekTo(Duration(milliseconds: targetMs));
  }

  Future<void> _openExternally() async {
    final uri = Uri.tryParse(widget.source.trim());
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  bool get _canOpenExternally {
    final uri = Uri.tryParse(widget.source.trim());
    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https' || uri.scheme == 'file');
  }

  Future<void> _onSurfaceTap() async {
    if (_ready) {
      await _togglePlayPause();
      return;
    }
    if (_canOpenExternally) {
      await _openExternally();
      return;
    }
    if (!_initializing) {
      await _initController();
    }
  }

  String _formatDuration(Duration value) {
    if (value <= Duration.zero) return '00:00';
    final totalSeconds = value.inSeconds;
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final value = _controller?.value;
    final hasController = value != null;
    final position = hasController ? value.position : Duration.zero;
    final duration = hasController ? value.duration : Duration.zero;
    final progress = duration.inMilliseconds > 0
        ? (position.inMilliseconds / duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: widget.secondaryTextColor.withValues(alpha: 0.08),
        border: Border.all(
          color: widget.secondaryTextColor.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                widget.isVideo
                    ? Icons.ondemand_video_rounded
                    : Icons.headphones_rounded,
                color: widget.bodyTextColor,
                size: 19,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.bodyTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                tooltip: widget.openLabel,
                onPressed: _onSurfaceTap,
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 6),
          if (widget.isVideo)
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: _onSurfaceTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: _buildVideoSurface(),
                  ),
                ),
              ),
            )
          else
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: _onSurfaceTap,
                child: _buildAudioSurface(),
              ),
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                onPressed: _onSurfaceTap,
                iconSize: 22,
                splashRadius: 22,
                icon: Icon(
                  (value?.isPlaying ?? false)
                      ? Icons.pause_circle_filled_rounded
                      : Icons.play_circle_fill_rounded,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 5,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 10,
                    ),
                  ),
                  child: Slider(
                    value: progress,
                    onChanged: _ready
                        ? (v) => unawaited(_seekToFraction(v))
                        : null,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${_formatDuration(position)} / ${_formatDuration(duration)}',
                style: TextStyle(
                  color: widget.secondaryTextColor,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            widget.source,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: widget.secondaryTextColor.withValues(alpha: 0.85),
              fontSize: 12,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoSurface() {
    if (_ready && _controller != null) {
      final value = _controller!.value;
      final ratio = value.aspectRatio > 0 ? value.aspectRatio : (16 / 9);
      return Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(aspectRatio: ratio, child: VideoPlayer(_controller!)),
          IgnorePointer(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 180),
              opacity: value.isPlaying ? 0 : 1,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.45),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      );
    }
    if (_initializing) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    return const AspectRatio(
      aspectRatio: 16 / 9,
      child: Center(
        child: Icon(Icons.play_circle_outline_rounded, color: Colors.white70),
      ),
    );
  }

  Widget _buildAudioSurface() {
    return Container(
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFEDF3FF), Color(0xFFDCE8FF)],
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.multitrack_audio_rounded,
              size: 20,
              color: Color(0xFF273B58),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: const Color(0xFF7E9CC6).withValues(alpha: 0.3),
              ),
              child: FractionallySizedBox(
                widthFactor: _ready ? 1.0 : (_initializing ? 0.35 : 0.2),
                alignment: Alignment.centerLeft,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color(
                      0xFF2B4D78,
                    ).withValues(alpha: _failed ? 0.45 : 0.78),
                  ),
                ),
              ),
            ),
          ),
          if (_initializing)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 1.8),
              ),
            ),
        ],
      ),
    );
  }
}
