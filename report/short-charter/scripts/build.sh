#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/setup-fonts.sh
latexmk -xelatex main.tex
