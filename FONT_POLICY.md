# Project Font and Preview Policy

The thesis, report, and CV templates use one shared typography contract. The fixed-layout `nsfc-general/` and `nsfc-young/` templates retain their own source-defined font contracts and are excluded from the rules below.

- Latin serif body text: **XCharter** (`XCharter-Roman`, Bold, Italic, BoldItalic)
- Mathematics: **XCharter-Math** with its matching bold math font
- Structural sans-serif text: **Latin Modern Sans**
- Chinese text: **LXGW WenKai Screen 1.522**
- Monospaced/code text: **Maple Mono 5.3.0**

No template governed by this shared contract may substitute another serif or mathematics family. Template-specific layout may vary, but font roles do not.

## Preview rule

All committed preview PNGs are generated directly from the final compiled PDF with:

```bash
pdftoppm -png -r 200
```

The renderer output is committed unchanged. Cropping, resizing, compositing, sharpening, annotation, manual reconstruction, or other image post-processing is prohibited. README files reference preview PNGs directly without HTML `width` or `height` attributes.

At 200 dpi, the current page sizes render to:

- US Letter: **1700 × 2200 px**
- A4: approximately **1654 × 2339 px**
