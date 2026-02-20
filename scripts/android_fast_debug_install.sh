#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DEVICE_ID="${1:-}"
if [[ -z "$DEVICE_ID" ]]; then
  DEVICE_ID="$(adb devices | awk 'NR>1 && $2=="device" {print $1; exit}')"
fi

if [[ -z "$DEVICE_ID" ]]; then
  echo "No Android device found. Connect a device and try again."
  exit 1
fi

echo "Using device: $DEVICE_ID"
echo "Building debug APK (arm64 only)..."
flutter build apk --debug --no-pub --target-platform android-arm64

APK_PATH="build/app/outputs/flutter-apk/app-debug.apk"
if [[ ! -f "$APK_PATH" ]]; then
  echo "APK not found: $APK_PATH"
  exit 1
fi

echo "Installing APK..."
adb -s "$DEVICE_ID" install -r "$APK_PATH"
echo "Done."
