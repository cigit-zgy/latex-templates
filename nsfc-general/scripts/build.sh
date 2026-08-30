#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
bash scripts/setup-fonts.sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
if grep -Fq '\citation' main.aux; then bibtex main; fi
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
test -s main.pdf
