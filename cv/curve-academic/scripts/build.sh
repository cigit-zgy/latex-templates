#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
./scripts/setup-fonts.sh
./scripts/setup-avatar.sh
latexmk -xelatex main.tex
