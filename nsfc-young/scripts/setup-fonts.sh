#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
for font in Arial-Regular.ttf Arial-Bold.ttf Arial-Italic.ttf Arial-BoldItalic.ttf SimSun.ttf KaiTi.ttf FangSong.ttf; do
  test -s "$ROOT/fonts/$font" || { echo "Missing bundled NSFC font: fonts/$font" >&2; exit 1; }
done
printf 'NSFC young template-local fonts verified.\n'
