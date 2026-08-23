# Preview policy

The `page-*.png` files are generated automatically from the compiled sample PDF by `.github/workflows/render-previews.yml` using `pdftoppm -png -r 72`.

Contract:

- direct renderer output only;
- intrinsic size is 612 × 792 px for the Letter-size sample at 72 dpi;
- no crop, resize, collage, sharpening, annotation, or manual reconstruction;
- README files reference the PNG directly and do not set HTML `width` or `height` attributes.

When the template changes visually, the GitHub Actions workflow rebuilds the PDF and replaces the preview files from renderer output.
