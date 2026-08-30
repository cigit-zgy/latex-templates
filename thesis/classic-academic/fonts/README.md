# Local font cache

This directory is populated by `../scripts/setup-fonts.sh`. Font binaries are intentionally not committed.

The template follows the repository-wide no-fallback font contract:

- XCharter: Latin serif body text, supplied by TeX Live / MacTeX;
- XCharter-Math: matching mathematics, supplied by TeX Live / MacTeX;
- Latin Modern Sans: structural sans-serif text, supplied by TeX Live / MacTeX;
- Maple Mono: Fontsource package version 5.3.0, normal and italic Latin 400 assets;
- LXGW WenKai Screen: version 1.522.

Run the setup script before the first build. Compilation stops when any required local font asset is absent.
