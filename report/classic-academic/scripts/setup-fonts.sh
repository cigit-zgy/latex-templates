#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p fonts

# Font sources are pinned to the same assets used by cigit-zgy/water-modeling-notes.
WATER_NOTES_COMMIT="462c5e1609978b27fc0774780229fc41a0aba8f8"
MAPLE_VERSION="5.3.0"
LXGW_VERSION="1.522"

LM_REGULAR_WOFF2="fonts/latin-modern-sans-regular.woff2"
LM_BOLD_WOFF2="fonts/latin-modern-sans-bold.woff2"
LM_REGULAR_TTF="fonts/latin-modern-sans-regular.ttf"
LM_BOLD_TTF="fonts/latin-modern-sans-bold.ttf"
MAPLE_NORMAL_WOFF2="fonts/maple-mono-latin-400-normal.woff2"
MAPLE_ITALIC_WOFF2="fonts/maple-mono-latin-400-italic.woff2"
MAPLE_NORMAL_TTF="fonts/maple-mono-latin-400-normal.ttf"
MAPLE_ITALIC_TTF="fonts/maple-mono-latin-400-italic.ttf"
LXGW_SCREEN="fonts/LXGWWenKaiScreen.ttf"

download() {
  local url="$1"
  local out="$2"
  if [[ -s "$out" ]]; then
    return
  fi
  printf 'Downloading %s\n' "$out"
  curl --fail --location --silent --show-error "$url" --output "$out.tmp"
  mv "$out.tmp" "$out"
}

if ! command -v woff2_decompress >/dev/null 2>&1; then
  echo "ERROR: woff2_decompress is required to prepare the pinned webfont assets." >&2
  echo "Install the woff2 package, then rerun this script." >&2
  exit 1
fi

# Latin Modern Sans: exact WOFF2 assets stored in water-modeling-notes.
download "https://raw.githubusercontent.com/cigit-zgy/water-modeling-notes/${WATER_NOTES_COMMIT}/src/assets/fonts/latin-modern-sans/latin-modern-sans-regular.woff2" "$LM_REGULAR_WOFF2"
download "https://raw.githubusercontent.com/cigit-zgy/water-modeling-notes/${WATER_NOTES_COMMIT}/src/assets/fonts/latin-modern-sans/latin-modern-sans-bold.woff2" "$LM_BOLD_WOFF2"

# Maple Mono: exact version declared by water-modeling-notes.
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-normal.woff2" "$MAPLE_NORMAL_WOFF2"
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-italic.woff2" "$MAPLE_ITALIC_WOFF2"

for webfont in "$LM_REGULAR_WOFF2" "$LM_BOLD_WOFF2" "$MAPLE_NORMAL_WOFF2" "$MAPLE_ITALIC_WOFF2"; do
  ttf="${webfont%.woff2}.ttf"
  if [[ ! -s "$ttf" ]]; then
    woff2_decompress "$webfont"
  fi
done

# Chinese family: exact version declared by water-modeling-notes.
download "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v${LXGW_VERSION}/LXGWWenKaiScreen.ttf" "$LXGW_SCREEN"

for font in \
  "$LM_REGULAR_TTF" \
  "$LM_BOLD_TTF" \
  "$MAPLE_NORMAL_TTF" \
  "$MAPLE_ITALIC_TTF" \
  "$LXGW_SCREEN"; do
  if [[ ! -s "$font" ]]; then
    echo "ERROR: font preparation failed: $font" >&2
    exit 1
  fi
done

printf 'Pinned font assets are ready. No fallback fonts are configured.\n'
