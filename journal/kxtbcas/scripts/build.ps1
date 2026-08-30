$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

& (Join-Path $PSScriptRoot "setup-fonts.ps1")

xelatex -interaction=nonstopmode -halt-on-error main.tex
bibtex main
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex

if (-not (Test-Path "main.pdf")) {
    throw "KXTB-CAS build did not produce main.pdf"
}
