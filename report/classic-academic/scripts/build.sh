#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/validate.sh
latexmk -xelatex main.tex
