#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p fonts

# Latin Modern Roman / Sans / Math are supplied by the TeX distribution.
# Only non-TeX font assets are prepared locally here.
MAPLE_VERSION="5.3.0"
LXGW_VERSION="1.522"

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
  echo "ERROR: woff2_decompress is required to prepare Maple Mono." >&2
  echo "Install the woff2 package, then rerun this script." >&2
  exit 1
fi

# Maple Mono: exact version declared by the template contract.
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-normal.woff2" "$MAPLE_NORMAL_WOFF2"
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-italic.woff2" "$MAPLE_ITALIC_WOFF2"

for webfont in "$MAPLE_NORMAL_WOFF2" "$MAPLE_ITALIC_WOFF2"; do
  ttf="${webfont%.woff2}.ttf"
  if [[ ! -s "$ttf" ]]; then
    woff2_decompress "$webfont"
  fi
done

# Chinese family: exact pinned release.
download "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v${LXGW_VERSION}/LXGWWenKaiScreen.ttf" "$LXGW_SCREEN"

for font in \
  "$MAPLE_NORMAL_TTF" \
  "$MAPLE_ITALIC_TTF" \
  "$LXGW_SCREEN"; do
  if [[ ! -s "$font" ]]; then
    echo "ERROR: font preparation failed: $font" >&2
    exit 1
  fi
done

printf 'Pinned non-TeX font assets are ready. Latin Modern is provided by TeX.\n'
