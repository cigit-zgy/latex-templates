#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/setup-fonts.sh
./scripts/validate.sh
latexmk -xelatex main.tex
