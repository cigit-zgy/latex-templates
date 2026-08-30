$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$fontDir = Join-Path $root "fonts"

$required = @(
    "TimesNewRoman-Regular.ttf",
    "TimesNewRoman-Bold.ttf",
    "TimesNewRoman-Italic.ttf",
    "TimesNewRoman-BoldItalic.ttf",
    "SimSun.ttf",
    "STIXTwoMath-Regular.otf"
)

foreach ($name in $required) {
    $path = Join-Path $fontDir $name
    if (-not (Test-Path $path) -or (Get-Item $path).Length -eq 0) {
        throw "Missing bundled KXTB-CAS font: fonts/$name"
    }
}

Write-Host "KXTB-CAS template-local Times New Roman + SimSun + STIX Two Math fonts verified."
