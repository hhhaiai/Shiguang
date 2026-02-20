#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "Building universal release APK for armeabi-v7a/arm64-v8a/x86_64..."
flutter build apk --release --no-pub --target-platform android-arm,android-arm64,android-x64
echo "Done: build/app/outputs/flutter-apk/app-release.apk"
