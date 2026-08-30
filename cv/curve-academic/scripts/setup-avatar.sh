#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p assets
curl --fail --location --silent --show-error \
  "https://avatars.githubusercontent.com/u/45927658?v=4&size=256" \
  -o assets/github-avatar.png
test -s assets/github-avatar.png || { echo "ERROR: GitHub avatar download failed" >&2; exit 1; }
