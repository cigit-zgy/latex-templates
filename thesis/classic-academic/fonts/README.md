# Local font cache

This directory is populated by `../scripts/setup-fonts.sh`. Font binaries are intentionally not committed.

The template uses an exact, no-fallback contract aligned with `cigit-zgy/water-modeling-notes`:

- Latin Modern Sans regular/bold: downloaded from the exact WOFF2 files stored in `water-modeling-notes`, pinned to commit `462c5e1609978b27fc0774780229fc41a0aba8f8`, then decompressed locally to TTF for XeLaTeX;
- Maple Mono: Fontsource package version 5.3.0, normal and italic Latin 400 assets;
- LXGW WenKai Screen: version 1.522;
- Latin Modern Math: required from TeX Live / MacTeX with no alternate math font configured.

Run the setup script before the first build. Compilation stops when any required local font asset is absent.
