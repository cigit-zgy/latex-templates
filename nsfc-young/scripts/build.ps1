$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

& (Join-Path $PSScriptRoot "setup-fonts.ps1")

xelatex -interaction=nonstopmode -halt-on-error main.tex
if (Select-String -Path "main.aux" -Pattern "\\citation" -Quiet) {
    bibtex main
}
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex

if (-not (Test-Path "main.pdf")) {
    throw "NSFC young build did not produce main.pdf"
}
