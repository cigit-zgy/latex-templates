$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$fontDir = Join-Path $root "fonts"
New-Item -ItemType Directory -Force -Path $fontDir | Out-Null

$searchDirs = @()
if ($env:KXTBCAS_FONT_SOURCE_DIR) {
    $searchDirs += $env:KXTBCAS_FONT_SOURCE_DIR
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
    param(
        [string]$Target,
        [string[]]$Candidates
    )
    $destination = Join-Path $fontDir $Target
    if (Test-Path $destination) { return }
    $source = Find-FontFile -Names $Candidates
    if (-not $source) {
        throw "Missing required KXTB-CAS font: $Target"
    }
    Copy-Item -Force $source $destination
}

Copy-RequiredFont "TimesNewRoman-Regular.ttf" @("TimesNewRoman-Regular.ttf", "times.ttf")
Copy-RequiredFont "TimesNewRoman-Bold.ttf" @("TimesNewRoman-Bold.ttf", "timesbd.ttf")
Copy-RequiredFont "TimesNewRoman-Italic.ttf" @("TimesNewRoman-Italic.ttf", "timesi.ttf")
Copy-RequiredFont "TimesNewRoman-BoldItalic.ttf" @("TimesNewRoman-BoldItalic.ttf", "timesbi.ttf")
Copy-RequiredFont "SimSun-Bold.ttf" @("SimSun-Bold.ttf", "simsunb.ttf")

$simsunTarget = Join-Path $fontDir "SimSun.ttf"
if (-not (Test-Path $simsunTarget)) {
    $simsunTtf = Find-FontFile -Names @("SimSun.ttf", "simsun.ttf")
    if ($simsunTtf) {
        Copy-Item -Force $simsunTtf $simsunTarget
    } else {
        $simsunTtc = Find-FontFile -Names @("simsun.ttc")
        if (-not $simsunTtc) {
            throw "Missing required KXTB-CAS SimSun font (SimSun.ttf or simsun.ttc)."
        }
        @"
from fontTools.ttLib import TTCollection
collection = TTCollection(r'''$simsunTtc''')
collection.fonts[0].save(r'''$simsunTarget''')
"@ | python -
    }
}

$required = @(
    "TimesNewRoman-Regular.ttf",
    "TimesNewRoman-Bold.ttf",
    "TimesNewRoman-Italic.ttf",
    "TimesNewRoman-BoldItalic.ttf",
    "SimSun.ttf",
    "SimSun-Bold.ttf"
)
foreach ($name in $required) {
    $path = Join-Path $fontDir $name
    if (-not (Test-Path $path) -or (Get-Item $path).Length -eq 0) {
        throw "KXTB-CAS font staging failed: $name"
    }
}

Write-Host "KXTB-CAS exact Times New Roman + SimSun fonts staged in $fontDir"
