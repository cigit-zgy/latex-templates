# Preview

A KXTB-CAS preview is committed only when it is rendered from a PDF built with the template-local exact Times New Roman and SimSun font files. The previous substitute-font preview was removed.

When an exact local build is available, render page 1 with:

```bash
pdftoppm -f 1 -singlefile -png -r 100 main.pdf preview/article
```

## Constraints

- Exact Times New Roman + SimSun build only.
- 100 DPI.
- No cropping.
- No resizing.
- No compositing.
- No sharpening.
- No annotation.
- No manual reconstruction.
