$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$fontDir = Join-Path $root "fonts"

$required = @(
    "Arial-Regular.ttf",
    "Arial-Bold.ttf",
    "Arial-Italic.ttf",
    "Arial-BoldItalic.ttf",
    "SimSun.ttf",
    "KaiTi.ttf",
    "FangSong.ttf"
)

foreach ($name in $required) {
    $path = Join-Path $fontDir $name
    if (-not (Test-Path $path) -or (Get-Item $path).Length -eq 0) {
        throw "Missing bundled NSFC font: fonts/$name"
    }
}

Write-Host "NSFC young template-local Arial + SimSun + KaiTi + FangSong fonts verified."
