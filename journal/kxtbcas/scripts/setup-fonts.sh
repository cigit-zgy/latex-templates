#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
for font in TimesNewRoman-Regular.ttf TimesNewRoman-Bold.ttf TimesNewRoman-Italic.ttf TimesNewRoman-BoldItalic.ttf SimSun.ttf STIXTwoMath-Regular.otf; do
  test -s "$ROOT/fonts/$font" || { echo "Missing bundled font: $font" >&2; exit 1; }
done
printf 'KXTB-CAS template-local fonts verified.\n'
