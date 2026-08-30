$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$fontDir = Join-Path $root "fonts"
New-Item -ItemType Directory -Force -Path $fontDir | Out-Null

$searchDirs = @()
if ($env:NSFC_FONT_SOURCE_DIR) {
    $searchDirs += $env:NSFC_FONT_SOURCE_DIR
}
$searchDirs += @(
    (Join-Path $env:WINDIR "Fonts"),
    (Join-Path $env:LOCALAPPDATA "Microsoft\Windows\Fonts")
)

function Find-FontFile {
    param([string[]]$Names)
    foreach ($directory in $searchDirs) {
        if (-not (Test-Path $directory)) { continue }
        foreach ($name in $Names) {
            $candidate = Join-Path $directory $name
            if (Test-Path $candidate) { return $candidate }
        }
    }
    return $null
}

function Copy-RequiredFont {
    param([string]$Target, [string[]]$Candidates)
    $destination = Join-Path $fontDir $Target
    if (Test-Path $destination) { return }
    $source = Find-FontFile -Names $Candidates
    if (-not $source) { throw "Missing required NSFC font: $Target" }
    Copy-Item -Force $source $destination
}

$simsunTarget = Join-Path $fontDir "SimSun.ttf"
if (-not (Test-Path $simsunTarget)) {
    $simsunTtf = Find-FontFile -Names @("SimSun.ttf", "simsun.ttf")
    if ($simsunTtf) {
        Copy-Item -Force $simsunTtf $simsunTarget
    } else {
        $simsunTtc = Find-FontFile -Names @("simsun.ttc")
        if (-not $simsunTtc) { throw "Missing required NSFC SimSun font." }
        @"
from fontTools.ttLib import TTCollection
collection = TTCollection(r'''$simsunTtc''')
collection.fonts[0].save(r'''$simsunTarget''')
"@ | python -
    }
}

Copy-RequiredFont "KaiTi.ttf" @("KaiTi.ttf", "simkai.ttf")
Copy-RequiredFont "FangSong.ttf" @("FangSong.ttf", "simfang.ttf")

foreach ($name in @("SimSun.ttf", "KaiTi.ttf", "FangSong.ttf")) {
    $path = Join-Path $fontDir $name
    if (-not (Test-Path $path) -or (Get-Item $path).Length -eq 0) {
        throw "NSFC font staging failed: $name"
    }
}

Write-Host "NSFC young exact SimSun + KaiTi + FangSong fonts staged in $fontDir"
