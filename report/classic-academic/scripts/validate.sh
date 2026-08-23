#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

if grep -R -n -E '\\begin\{(tabular|tabularx|longtable)\}' sections --include='*.tex'; then
  echo "ERROR: raw tabular/tabularx/longtable is forbidden in content files." >&2
  echo "Use \\begin{AcademicTable}{...} so every table occupies the full line width." >&2
  exit 1
fi

command -v kpsewhich >/dev/null 2>&1 || {
  echo "ERROR: kpsewhich is required to validate TeX-distributed fonts." >&2
  exit 1
}

for tex_font in \
  lmroman10-regular.otf \
  lmroman10-bold.otf \
  lmroman10-italic.otf \
  lmroman10-bolditalic.otf \
  lmsans10-regular.otf \
  lmsans10-bold.otf \
  latinmodern-math.otf; do
  if ! kpsewhich "$tex_font" >/dev/null 2>&1; then
    echo "ERROR: required TeX font missing: $tex_font" >&2
    exit 1
  fi
done

for font in \
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
