#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
bash ./scripts/setup-fonts.sh
latexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex
