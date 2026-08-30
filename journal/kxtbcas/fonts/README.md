# KXTB-CAS fonts

This font directory belongs only to the KXTB-CAS template. The template follows the reference project exactly for text fonts: Times New Roman for Latin text and SimSun for Chinese text. The display-family roles used by the original class are mapped to the same serif files.

Required local filenames: `TimesNewRoman-Regular.ttf`, `TimesNewRoman-Bold.ttf`, `TimesNewRoman-Italic.ttf`, `TimesNewRoman-BoldItalic.ttf`, `SimSun.ttf`, and `SimSun-Bold.ttf`.

The public repository does not redistribute proprietary font binaries. `scripts/setup-fonts.sh` copies legally installed local files into this template-local directory. Set `KXTBCAS_FONT_SOURCE_DIR` when the fonts are installed elsewhere. Missing exact files stop the build; no substitute font is selected.
