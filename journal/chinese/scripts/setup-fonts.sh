#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p fonts
LXGW_VERSION="1.522"
TARGET="fonts/LXGWWenKaiScreen.ttf"
if [[ ! -s "$TARGET" ]]; then
  curl --fail --location --silent --show-error \
    "https://github.com/lxgw/LxgwWenKai-Screen/releases/download/v${LXGW_VERSION}/LXGWWenKaiScreen.ttf" \
    -o "$TARGET"
fi
