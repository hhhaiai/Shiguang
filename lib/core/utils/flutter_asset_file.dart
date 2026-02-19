import 'dart:io';

/// Resolve a Flutter asset as a real file path when the platform exposes
/// `flutter_assets` on disk (iOS/macOS).
///
/// Returns `null` if the asset cannot be resolved as a file path.
String? resolveBundledAssetFilePath(String assetPath) {
  if (!Platform.isIOS && !Platform.isMacOS) {
    return null;
  }

  final executableDir = File(Platform.resolvedExecutable).parent.path;
  final normalized = assetPath.startsWith('/')
      ? assetPath.substring(1)
      : assetPath;

  final candidates = <String>[
    '$executableDir/Frameworks/App.framework/flutter_assets/$normalized',
    '$executableDir/flutter_assets/$normalized',
    '$executableDir/App.framework/flutter_assets/$normalized',
  ];

  for (final candidate in candidates) {
    final file = File(candidate);
    if (file.existsSync() && file.lengthSync() > 0) {
      return file.path;
    }
  }

  return null;
}
