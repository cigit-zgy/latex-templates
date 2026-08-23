#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

if grep -R -n -E '\\begin\{(tabular|tabularx|longtable)\}' chapters frontmatter --include='*.tex'; then
  echo "ERROR: raw tabular/tabularx/longtable is forbidden in content files." >&2
  echo "Use \\begin{AcademicTable}{...} so every table occupies the full line width." >&2
  exit 1
fi

for font in \
  fonts/latin-modern-sans-regular.ttf \
  fonts/latin-modern-sans-bold.ttf \
  fonts/maple-mono-latin-400-normal.ttf \
  fonts/maple-mono-latin-400-italic.ttf \
  fonts/LXGWWenKaiScreen.ttf; do
  if [[ ! -f "$font" ]]; then
    echo "ERROR: required font asset missing: $font" >&2
    echo "Run ./scripts/setup-fonts.sh first. No fallback fonts are used." >&2
    exit 1
  fi
done

echo "Template validation passed."
