from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEMPLATE = ROOT / "journal" / "kxtbcas"
CLASS = TEMPLATE / "kxtbcas.cls"

if not TEMPLATE.is_dir():
    raise SystemExit("journal/kxtbcas is missing")

text = CLASS.read_text(encoding="utf-8")
font_block_start = text.index("% Portable bundled default:")
font_api_start = text.index(r"\newcommand{\kxtbsetfontroot}")
font_block = r'''% Template-local exact font contract. The font files are staged into
% ./fonts by scripts/setup-fonts.sh; silent typeface substitution is forbidden.
\def\kxtb@latinfontpath{./fonts/}
\def\kxtb@cjkfontpath{./fonts/}
\def\kxtb@latinfont@upright{TimesNewRoman-Regular.ttf}
\def\kxtb@latinfont@bold{TimesNewRoman-Bold.ttf}
\def\kxtb@latinfont@italic{TimesNewRoman-Italic.ttf}
\def\kxtb@latinfont@bolditalic{TimesNewRoman-BoldItalic.ttf}
\def\kxtb@cjkfont@upright{SimSun.ttf}
\def\kxtb@cjkfont@bold{SimSun-Bold.ttf}
\def\kxtb@cjkfont@italic{SimSun.ttf}
\def\kxtb@mathfont{STIX Two Math}

'''
text = text[:font_block_start] + font_block + text[font_api_start:]

latin_start = text.index(r"\newcommand{\kxtb@applylatinfonts}")
math_start = text.index(r"\newcommand{\kxtb@applymathfont}")
loaders = r'''\newcommand{\kxtb@applylatinfonts}{%
  \IfFileExists{\kxtb@latinfontpath\kxtb@latinfont@upright}{%
    \setmainfont[
      Path=\kxtb@latinfontpath,
      UprightFont=\kxtb@latinfont@upright,
      BoldFont=\kxtb@latinfont@bold,
      ItalicFont=\kxtb@latinfont@italic,
      BoldItalicFont=\kxtb@latinfont@bolditalic
    ]{\kxtb@latinfont@upright}%
    \setsansfont[
      Path=\kxtb@latinfontpath,
      UprightFont=\kxtb@latinfont@upright,
      BoldFont=\kxtb@latinfont@bold,
      ItalicFont=\kxtb@latinfont@italic,
      BoldItalicFont=\kxtb@latinfont@bolditalic
    ]{\kxtb@latinfont@upright}%
  }{%
    \ClassError{kxtbcas}{Required Times New Roman files are missing}{Run ./scripts/setup-fonts.sh before compiling this template.}%
  }%
}

\newcommand{\kxtb@applycjkfonts}{%
  \IfFileExists{\kxtb@cjkfontpath\kxtb@cjkfont@upright}{%
    \setCJKmainfont[
      Path=\kxtb@cjkfontpath,
      UprightFont=\kxtb@cjkfont@upright,
      BoldFont=\kxtb@cjkfont@bold,
      ItalicFont=\kxtb@cjkfont@italic
    ]{\kxtb@cjkfont@upright}%
    \setCJKsansfont[
      Path=\kxtb@cjkfontpath,
      UprightFont=\kxtb@cjkfont@upright,
      BoldFont=\kxtb@cjkfont@bold,
      ItalicFont=\kxtb@cjkfont@italic
    ]{\kxtb@cjkfont@upright}%
  }{%
    \ClassError{kxtbcas}{Required SimSun files are missing}{Run ./scripts/setup-fonts.sh before compiling this template.}%
  }%
}

'''
text = text[:latin_start] + loaders + text[math_start:]
for forbidden in ("FandolSong", "FandolHei", "TeX Gyre Termes", "Heiti SC", "STHeiti", "STSong", "Songti SC"):
    if forbidden in text:
        raise SystemExit(f"fallback typeface remains in kxtbcas.cls: {forbidden}")
for required in (
    "TimesNewRoman-Regular.ttf",
    "TimesNewRoman-Bold.ttf",
    "TimesNewRoman-Italic.ttf",
    "TimesNewRoman-BoldItalic.ttf",
    "SimSun.ttf",
    "SimSun-Bold.ttf",
    r"\setsansfont[",
    r"\setCJKsansfont[",
):
    if required not in text:
        raise SystemExit(f"missing exact font contract: {required}")
CLASS.write_text(text, encoding="utf-8")

fonts = TEMPLATE / "fonts"
fonts.mkdir(exist_ok=True)
(fonts / ".gitignore").write_text(
    "*.ttf\n*.ttc\n*.otf\n!.gitignore\n!README.md\n", encoding="utf-8"
)
(fonts / "README.md").write_text(
    "# KXTB-CAS fonts\n\n"
    "This font directory belongs only to the KXTB-CAS template. The template follows the reference project exactly for text fonts: Times New Roman for Latin text and SimSun for Chinese text. The display-family roles used by the original class are mapped to the same serif files.\n\n"
    "Required local filenames: `TimesNewRoman-Regular.ttf`, `TimesNewRoman-Bold.ttf`, `TimesNewRoman-Italic.ttf`, `TimesNewRoman-BoldItalic.ttf`, `SimSun.ttf`, and `SimSun-Bold.ttf`.\n\n"
    "The public repository does not redistribute proprietary font binaries. `scripts/setup-fonts.sh` copies legally installed local files into this template-local directory. Set `KXTBCAS_FONT_SOURCE_DIR` when the fonts are installed elsewhere. Missing exact files stop the build; no substitute font is selected.\n",
    encoding="utf-8",
)

scripts = TEMPLATE / "scripts"
scripts.mkdir(exist_ok=True)
(scripts / "setup-fonts.sh").write_text(
    r'''#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FONT_DIR="$ROOT/fonts"
mkdir -p "$FONT_DIR"

search_dirs=()
if [[ -n "${KXTBCAS_FONT_SOURCE_DIR:-}" ]]; then
  search_dirs+=("$KXTBCAS_FONT_SOURCE_DIR")
fi
search_dirs+=(
  "$HOME/Library/Fonts"
  "/Library/Fonts"
  "/System/Library/Fonts"
  "$HOME/.local/share/fonts"
  "/usr/local/share/fonts"
  "/usr/share/fonts"
  "/Applications/Microsoft Word.app/Contents/Resources/DFonts"
)

copy_required() {
  local target="$1"
  shift
  if [[ -s "$FONT_DIR/$target" ]]; then
    return
  fi
  local directory candidate found
  for directory in "${search_dirs[@]}"; do
    [[ -d "$directory" ]] || continue
    for candidate in "$@"; do
      found="$(find "$directory" -type f -iname "$candidate" -print -quit 2>/dev/null || true)"
      if [[ -n "$found" ]]; then
        cp "$found" "$FONT_DIR/$target"
        return
      fi
    done
  done
  echo "Missing required KXTB-CAS font: $target" >&2
  echo "Place the exact font file in $FONT_DIR or set KXTBCAS_FONT_SOURCE_DIR." >&2
  exit 1
}

copy_required "TimesNewRoman-Regular.ttf" "TimesNewRoman-Regular.ttf" "Times New Roman.ttf" "times.ttf"
copy_required "TimesNewRoman-Bold.ttf" "TimesNewRoman-Bold.ttf" "Times New Roman Bold.ttf" "timesbd.ttf"
copy_required "TimesNewRoman-Italic.ttf" "TimesNewRoman-Italic.ttf" "Times New Roman Italic.ttf" "timesi.ttf"
copy_required "TimesNewRoman-BoldItalic.ttf" "TimesNewRoman-BoldItalic.ttf" "Times New Roman Bold Italic.ttf" "timesbi.ttf"
copy_required "SimSun.ttf" "SimSun.ttf" "simsun.ttf"
copy_required "SimSun-Bold.ttf" "SimSun-Bold.ttf" "SimSun Bold.ttf" "simsunb.ttf"

printf 'KXTB-CAS exact fonts staged in %s\n' "$FONT_DIR"
''',
    encoding="utf-8",
)
(scripts / "build.sh").write_text(
    '#!/usr/bin/env bash\nset -euo pipefail\ncd "$(dirname "$0")/.."\n./scripts/setup-fonts.sh\nlatexmk -xelatex -interaction=nonstopmode -halt-on-error main.tex\n',
    encoding="utf-8",
)

# Existing self-owned templates keep their own font folders; make font staging automatic.
for relative in (
    "thesis/classic-academic/scripts/build.sh",
    "report/classic-academic/scripts/build.sh",
):
    path = ROOT / relative
    build = path.read_text(encoding="utf-8")
    if "./scripts/setup-fonts.sh" not in build:
        build = build.replace(
            './scripts/validate.sh\n',
            './scripts/setup-fonts.sh\n./scripts/validate.sh\n',
            1,
        )
        path.write_text(build, encoding="utf-8")

# KXTB-CAS is project-owned and no longer synchronized from a differently named folder.
sync = ROOT / "scripts" / "sync-journal-sources.sh"
sync_text = sync.read_text(encoding="utf-8")
sync_text = "\n".join(
    line
    for line in sync_text.splitlines()
    if "chinese/kxtbcas" not in line and "journal/chinese" not in line
) + "\n"
sync.write_text(sync_text, encoding="utf-8")

for path in (ROOT / "README.md", TEMPLATE / "README.md"):
    doc = path.read_text(encoding="utf-8")
    doc = doc.replace("journal/chinese", "journal/kxtbcas")
    doc = doc.replace("Chinese Journal Template", "KXTB-CAS Template")
    doc = doc.replace("Chinese scientific manuscript, `kxtbcas`", "KXTB-CAS / 科学通报 manuscript")
    doc = doc.replace("Journal · Chinese", "Journal · KXTB-CAS")
    doc = doc.replace("Chinese journal article", "KXTB-CAS article")
    doc = doc.replace("Chinese `kxtbcas`", "KXTB-CAS `kxtbcas`")
    doc = doc.replace("`journal/chinese`", "`journal/kxtbcas`")
    doc = doc.replace(
        "The class keeps the original Times/SimSun serif roles and resolves portable fallbacks to TeX Gyre Termes and Song-style serif Chinese families. Both body and display-family roles are serif.",
        "The template uses the exact Times New Roman and SimSun files defined by the reference KXTB-CAS class. Roman and display-family roles resolve to those same serif files, and silent substitution is disabled."
    )
    doc = doc.replace(
        "The class requires XeLaTeX. Portable fallback fonts preserve the same serif typography without introducing a sans-serif Chinese display family.",
        "Run `./scripts/build.sh`. Its template-local setup copies the required Times New Roman and SimSun files into `fonts/` before XeLaTeX runs."
    )
    path.write_text(doc, encoding="utf-8")

cache_script = ROOT / "scripts" / "update-preview-revisions.py"
if cache_script.is_file():
    cache_script.write_text(
        cache_script.read_text(encoding="utf-8").replace(
            "journal/chinese", "journal/kxtbcas"
        ),
        encoding="utf-8",
    )

Path(__file__).unlink()
