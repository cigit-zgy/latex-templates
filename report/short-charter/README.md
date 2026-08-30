# Short Charter Report

A section-based XeLaTeX template for compact scientific or technical reports of roughly 8–12 pages.

The Latin text family is **XCharter**, an open extension of Bitstream Charter; mathematics uses the matching **XCharter-Math** OpenType math font. Structural sans-serif text uses Latin Modern Sans, Chinese uses **LXGW WenKai Screen 1.522**, and code uses **Maple Mono 5.3.0**.

The template borrows the restrained red/blue palette and heading logic from the `classic-academic` family, but uses a compact single-sided A4 `article` layout whose document hierarchy starts at `section`.

## Build

```bash
./scripts/build.sh
```

The sample compiles to approximately ten pages. All manuscript tables use the full line width through `AcademicTable`.

## Preview

![Short report title page](preview/page-01.png)

![Short report section page](preview/page-03.png)

Preview images are direct 72-dpi renders of the compiled PDF. They must not be cropped, resized, composited, sharpened, annotated, or redrawn.
