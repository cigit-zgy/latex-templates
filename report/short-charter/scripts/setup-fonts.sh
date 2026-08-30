#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p fonts
MAPLE_VERSION="5.3.0"
LXGW_VERSION="1.522"
download(){ local u="$1" o="$2"; [[ -s "$o" ]] || curl --fail --location --silent --show-error "$u" -o "$o"; }
command -v woff2_decompress >/dev/null || { echo "woff2_decompress is required" >&2; exit 1; }
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-normal.woff2" fonts/maple-mono-latin-400-normal.woff2
download "https://cdn.jsdelivr.net/npm/@fontsource/maple-mono@${MAPLE_VERSION}/files/maple-mono-latin-400-italic.woff2" fonts/maple-mono-latin-400-italic.woff2
[[ -s fonts/maple-mono-latin-400-normal.ttf ]] || woff2_decompress fonts/maple-mono-latin-400-normal.woff2
[[ -s fonts/maple-mono-latin-400-italic.ttf ]] || woff2_decompress fonts/maple-mono-latin-400-italic.woff2
download "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v${LXGW_VERSION}/LXGWWenKaiScreen.ttf" fonts/LXGWWenKaiScreen.ttf
