#!/usr/bin/env python3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TEMPLATES = [
    ROOT / "thesis/classic-academic",
    ROOT / "report/classic-academic",
    ROOT / "report/short-charter",
]

EXPECTED_THEME = """% Shared project palette. Keep equivalent roles identical across templates.
\\colorlet{AcademicAccent}{BrickRed}
\\colorlet{AcademicLevelOne}{BrickRed}
\\colorlet{AcademicLevelTwo}{RoyalBlue}
\\colorlet{AcademicLevelThree}{ForestGreen}
\\colorlet{AcademicChapter}{BrickRed}
\\colorlet{AcademicLink}{RoyalBlue}
\\colorlet{AcademicText}{Black}
\\colorlet{AcademicMuted}{Gray}
\\colorlet{AcademicRule}{Black!35}
\\colorlet{AcademicCodeBackground}{Black!3}
"""

REQUIRED_LAYOUT_TOKENS = [
    r"\setlength{\parindent}{1.2em}",
    r"\setlength{\parskip}{0pt}",
    r"\linespread{1.08}",
    r"\AcademicHeadingFont\bfseries\fontsize{16}{20}\selectfont\color{AcademicLevelOne}",
    r"\AcademicHeadingFont\bfseries\fontsize{13}{16}\selectfont\color{AcademicLevelTwo}",
    r"\AcademicHeadingFont\bfseries\fontsize{11}{14}\selectfont\color{AcademicLevelThree}",
    r"\titlespacing*{\section}{0pt}{3.0ex plus .8ex minus .2ex}{1.1ex}",
    r"\titlespacing*{\subsection}{0pt}{2.4ex plus .6ex minus .2ex}{0.8ex}",
    r"\titlespacing*{\subsubsection}{0pt}{2.0ex plus .5ex minus .2ex}{0.6ex}",
    r"\renewcommand{\headrulewidth}{0pt}",
]

REQUIRED_TYPOGRAPHY_TOKENS = [
    r"\setmainfont{XCharter-Roman.otf}",
    r"\setmathfont{XCharter-Math.otf}[BoldFont=XCharter-Math-Bold.otf]",
    r"\setsansfont{lmsans10-regular.otf}",
    r"\newfontfamily\AcademicHeadingFont{lmsans10-regular.otf}",
    "LetterSpace=2",
]

DEPRECATED_STYLE_TOKENS = [r"\AcademicSans"]

for template in TEMPLATES:
    theme = (template / "config/theme.tex").read_text()
    if theme != EXPECTED_THEME:
        raise SystemExit(f"style contract violation: theme differs in {template}")

    main = (template / "main.tex").read_text()
    if r"\usepackage[dvipsnames]{xcolor}" not in main:
        raise SystemExit(f"style contract violation: dvipsnames xcolor missing in {template}")

    typography = (template / "style/typography.tex").read_text()
    for token in REQUIRED_TYPOGRAPHY_TOKENS:
        if token not in typography:
            raise SystemExit(f"style contract violation: {token!r} missing in {template}/style/typography.tex")

    layout = (template / "style/layout.tex").read_text()
    for token in REQUIRED_LAYOUT_TOKENS:
        if token not in layout:
            raise SystemExit(f"style contract violation: {token!r} missing in {template}/style/layout.tex")

    components = (template / "style/components.tex").read_text()
    if r"\renewcommand{\arraystretch}{1.16}" not in components:
        raise SystemExit(f"style contract violation: table row spacing differs in {template}")
    if r"rulecolor=\color{AcademicRule}" not in components:
        raise SystemExit(f"style contract violation: code frame colour differs in {template}")

    for tex_file in template.rglob("*.tex"):
        text = tex_file.read_text()
        for token in DEPRECATED_STYLE_TOKENS:
            if token in text:
                raise SystemExit(
                    f"style contract violation: deprecated token {token!r} in {tex_file}"
                )

print("Shared thesis/report style contract: PASS")
