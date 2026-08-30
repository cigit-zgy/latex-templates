#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

sudo apt-get update -qq
sudo apt-get install -qq -y --no-install-recommends \
  cabextract curl poppler-utils \
  texlive-xetex texlive-latex-extra texlive-fonts-recommended \
  texlive-fonts-extra texlive-lang-chinese texlive-bibtex-extra \
  texlive-science latexmk
sudo mktexlsr

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/core"

# Exact Times New Roman and Arial files used by the templates.
curl --fail --location --retry 3 https://downloads.sourceforge.net/corefonts/times32.exe -o "$work/times32.exe"
curl --fail --location --retry 3 https://downloads.sourceforge.net/corefonts/arial32.exe -o "$work/arial32.exe"
cabextract -q -L -d "$work/core" "$work/times32.exe"
cabextract -q -L -d "$work/core" "$work/arial32.exe"
(
  cd "$work/core"
  printf '%s  %s\n' \
    4e98adeff8ccc8ef4e3ece8d4547e288ff85fdc9c7ca711a4599c234874bbe86 times.ttf \
    4357b63cef20c01661a53c5dae70ffd20cb4765503aaed6d38b17a57c5a90bff timesbd.ttf \
    192e1b0d18e90334e999a99f8c32808d6a2e74b3698b8cd90c943c2249a46549 timesbi.ttf \
    c25ae529b4cecdbca148b6ccb862ee0abad770af8b1fd29c8dba619d1b8da78a timesi.ttf \
    35c0f3559d8db569e36c31095b8a60d441643d95f59139de40e23fada819b833 arial.ttf \
    4044aa6b5bebbc36980206b45b0aaaaa5681552a48bcadb41746d5d1d71fd7b4 arialbd.ttf \
    2f371cd9d96b3ac544519d85c16dc43ceacdfcea35090ee8ddf3ec5857c50328 arialbi.ttf \
    70ade233175a6a6675e4501461af9326e6f78b1ffdf787ca0da5ab0fc8c9cfd6 ariali.ttf \
    | sha256sum -c -
)

# Exact Chinese fonts used by the NSFC template, pinned to its source revision.
nsfc_base="https://raw.githubusercontent.com/andy123t/nsfc-latex/11a02726f6190fcb89859dfaed18e3d1d68af0b8/fonts"
for font in SimSun.ttf KaiTi.ttf FangSong.ttf; do
  curl --fail --location --retry 3 "$nsfc_base/$font" -o "$work/$font"
  test -s "$work/$font"
done

# Exact STIX Two Math from the official STIX repository, pinned to v2.13b171.
stix_url="https://raw.githubusercontent.com/stipub/stixfonts/v2.13b171/fonts/static_otf/STIXTwoMath-Regular.otf"
curl --fail --location --retry 3 "$stix_url" -o "$work/STIXTwoMath-Regular.otf"
test -s "$work/STIXTwoMath-Regular.otf"
test "$(git hash-object "$work/STIXTwoMath-Regular.otf")" = "29aa3b941578bd5afe71682724370e62f5879e55"

for dir in journal/kxtbcas/fonts nsfc-general/fonts nsfc-young/fonts; do
  mkdir -p "$dir"
  rm -f "$dir/.gitignore"
  find "$dir" -maxdepth 1 -type f \( -iname '*.ttf' -o -iname '*.ttc' -o -iname '*.otf' \) -delete
done

cp "$work/core/times.ttf" journal/kxtbcas/fonts/TimesNewRoman-Regular.ttf
cp "$work/core/timesbd.ttf" journal/kxtbcas/fonts/TimesNewRoman-Bold.ttf
cp "$work/core/timesi.ttf" journal/kxtbcas/fonts/TimesNewRoman-Italic.ttf
cp "$work/core/timesbi.ttf" journal/kxtbcas/fonts/TimesNewRoman-BoldItalic.ttf
cp "$work/SimSun.ttf" journal/kxtbcas/fonts/SimSun.ttf
cp "$work/STIXTwoMath-Regular.otf" journal/kxtbcas/fonts/STIXTwoMath-Regular.otf

for template in nsfc-general nsfc-young; do
  cp "$work/core/arial.ttf" "$template/fonts/Arial-Regular.ttf"
  cp "$work/core/arialbd.ttf" "$template/fonts/Arial-Bold.ttf"
  cp "$work/core/ariali.ttf" "$template/fonts/Arial-Italic.ttf"
  cp "$work/core/arialbi.ttf" "$template/fonts/Arial-BoldItalic.ttf"
  cp "$work/SimSun.ttf" "$template/fonts/SimSun.ttf"
  cp "$work/KaiTi.ttf" "$template/fonts/KaiTi.ttf"
  cp "$work/FangSong.ttf" "$template/fonts/FangSong.ttf"
done

python3 - <<'PY'
from pathlib import Path

kxtb = Path("journal/kxtbcas/kxtbcas.cls")
text = kxtb.read_text(encoding="utf-8")
expected = {
    r"\def\kxtb@cjkfont@bold{SimSun-Bold.ttf}": r"\def\kxtb@cjkfont@bold{SimSun.ttf}",
    r"\def\kxtb@mathfont{STIX Two Math}": r"\def\kxtb@mathfont{STIXTwoMath-Regular.otf}",
}
for old, new in expected.items():
    if old not in text:
        raise SystemExit(f"KXTB expected token missing: {old}")
    text = text.replace(old, new, 1)

if text.count("      UprightFont=\\kxtb@latinfont@upright,\n") != 2:
    raise SystemExit("Unexpected KXTB Latin UprightFont count")
text = text.replace("      UprightFont=\\kxtb@latinfont@upright,\n", "")
if text.count("      UprightFont=\\kxtb@cjkfont@upright,\n") != 2:
    raise SystemExit("Unexpected KXTB CJK UprightFont count")
text = text.replace("      UprightFont=\\kxtb@cjkfont@upright,\n", "")
if text.count("      BoldFont=\\kxtb@cjkfont@bold,\n") != 2:
    raise SystemExit("Unexpected KXTB CJK BoldFont count")
text = text.replace("      BoldFont=\\kxtb@cjkfont@bold,\n", "      AutoFakeBold=3,\n")

old_math = r"""\newcommand{\kxtb@applymathfont}{%
  \ifstrempty{\kxtb@mathfont}{}{%
    \IfFontExistsTF{\kxtb@mathfont}{\setmathfont{\kxtb@mathfont}}{}%
  }%
}"""
new_math = r"""\newcommand{\kxtb@applymathfont}{%
  \ifstrempty{\kxtb@mathfont}{}{%
    \IfFileExists{\kxtb@latinfontpath\kxtb@mathfont}{%
      \setmathfont[Path=\kxtb@latinfontpath]{\kxtb@mathfont}%
    }{%
      \ClassError{kxtbcas}{Required STIX Two Math file is missing}{Restore the template-local fonts/ directory from the repository.}%
    }%
  }%
}"""
if old_math not in text:
    raise SystemExit("KXTB math-font application block missing")
text = text.replace(old_math, new_math, 1)
text = text.replace(
    "Run ./scripts/setup-fonts.sh before compiling this template.",
    "Restore the template-local fonts/ directory from the repository.",
)
kxtb.write_text(text, encoding="utf-8")

Path("journal/kxtbcas/scripts/setup-fonts.sh").write_text(
    """#!/usr/bin/env bash
set -euo pipefail
ROOT=\"$(cd \"$(dirname \"$0\")/..\" && pwd)\"
for font in TimesNewRoman-Regular.ttf TimesNewRoman-Bold.ttf TimesNewRoman-Italic.ttf TimesNewRoman-BoldItalic.ttf SimSun.ttf STIXTwoMath-Regular.otf; do
  test -s \"$ROOT/fonts/$font\" || { echo \"Missing bundled font: $font\" >&2; exit 1; }
done
printf 'KXTB-CAS template-local fonts verified.\\n'
""",
    encoding="utf-8",
)

for folder in ("nsfc-general", "nsfc-young"):
    cls = Path(folder) / "nsfc.cls"
    data = cls.read_text(encoding="utf-8")
    old = r"\setsansfont[Scale=0.98]{Arial}"
    new = """\\setsansfont[
  Path=fonts/,
  BoldFont=Arial-Bold.ttf,
  ItalicFont=Arial-Italic.ttf,
  BoldItalicFont=Arial-BoldItalic.ttf,
  Scale=0.98
]{Arial-Regular.ttf}"""
    if old not in data:
        raise SystemExit(f"Missing Arial declaration in {cls}")
    cls.write_text(data.replace(old, new, 1), encoding="utf-8")

Path("journal/kxtbcas/fonts/README.md").write_text(
    "# Template-local fonts\n\nKXTB-CAS uses only the files in this directory: Times New Roman Regular/Bold/Italic/BoldItalic, SimSun, and STIX Two Math. The class resolves both Latin roman/display roles to Times New Roman and both Chinese roman/display roles to SimSun. Chinese bold locations retain the class-defined `\\bfseries` semantics through XeCJK `AutoFakeBold=3` on the full SimSun face.\n",
    encoding="utf-8",
)
for folder in ("nsfc-general", "nsfc-young"):
    Path(folder, "fonts", "README.md").write_text(
        "# Template-local fonts\n\nThis NSFC template uses only the files in this directory: Arial Regular/Bold/Italic/BoldItalic, SimSun, KaiTi, and FangSong. No system-font lookup or cross-template font sharing is required.\n",
        encoding="utf-8",
    )
PY
chmod +x journal/kxtbcas/scripts/setup-fonts.sh

# Build the current KXTB-CAS source itself and inspect the resulting PDF fonts.
(
  cd journal/kxtbcas
  ./scripts/build.sh
  if grep -q 'Missing character:' main.log; then
    grep 'Missing character:' main.log | head -n 30 >&2
    exit 1
  fi
  pdffonts main.pdf | tee /tmp/kxtb-fonts.txt
  grep -Eiq 'TimesNewRoman|Times.New.Roman' /tmp/kxtb-fonts.txt
  grep -Eiq 'SimSun' /tmp/kxtb-fonts.txt
  ! grep -Eiq 'FandolHei|FandolSong|TeXGyreTermes|TeX.Gyre.Termes' /tmp/kxtb-fonts.txt
  mkdir -p preview
  rm -f preview/*.png
  pdftoppm -f 1 -singlefile -png -r 100 main.pdf preview/article
  pdftoppm -f 2 -singlefile -png -r 100 main.pdf preview/content
)

# Build each current NSFC source itself. BibTeX is only needed when the source actually cites something.
for template in nsfc-general nsfc-young; do
  (
    cd "$template"
    xelatex -interaction=nonstopmode -halt-on-error main.tex
    if grep -Fq '\citation' main.aux; then
      bibtex main
    fi
    xelatex -interaction=nonstopmode -halt-on-error main.tex
    xelatex -interaction=nonstopmode -halt-on-error main.tex
    if grep -q 'Missing character:' main.log; then
      grep 'Missing character:' main.log | head -n 30 >&2
      exit 1
    fi
    pdffonts main.pdf | tee "/tmp/${template}-fonts.txt"
    grep -Eiq 'SimSun' "/tmp/${template}-fonts.txt"
    grep -Eiq 'KaiTi' "/tmp/${template}-fonts.txt"
    mkdir -p preview
    rm -f preview/*.png
    pdftoppm -f 1 -singlefile -png -r 100 main.pdf preview/application
    pdftoppm -f 2 -singlefile -png -r 100 main.pdf preview/content
  )
done

python3 - <<'PY'
import struct
from pathlib import Path

paths = (
    Path("journal/kxtbcas/preview/article.png"),
    Path("journal/kxtbcas/preview/content.png"),
    Path("nsfc-general/preview/application.png"),
    Path("nsfc-general/preview/content.png"),
    Path("nsfc-young/preview/application.png"),
    Path("nsfc-young/preview/content.png"),
)
for path in paths:
    data = path.read_bytes()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise SystemExit(f"Not a PNG: {path}")
    width, height = struct.unpack(">II", data[16:24])
    if (width, height) not in {(827, 1169), (827, 1170)}:
        raise SystemExit(f"Unexpected 100-DPI A4 size {width}x{height}: {path}")
    print(f"verified {path}: {width}x{height}")
PY

# The temporary scripts can disappear in the resulting commit. The workflow is removed separately
# after this run because an Actions token cannot rewrite workflow files reliably.
rm -f scripts/vendor-fonts-once.sh scripts/vendor-fonts-once-v2.sh scripts/vendor-fonts-once-v3.sh

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add -A
git add -f \
  journal/kxtbcas/fonts/*.ttf journal/kxtbcas/fonts/*.otf \
  nsfc-general/fonts/*.ttf nsfc-young/fonts/*.ttf \
  journal/kxtbcas/preview/*.png \
  nsfc-general/preview/*.png nsfc-young/preview/*.png
git status --short

git commit -m "fix: bundle exact fonts and render template previews"
git push origin master
