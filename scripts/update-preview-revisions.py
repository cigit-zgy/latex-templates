#!/usr/bin/env python3
"""Attach content hashes to README preview URLs.

GitHub may cache rendered README images when a PNG is replaced at the same path.
This script keeps the PNG bytes untouched and changes only the Markdown URL query
parameter. The query value is derived from the current PNG content, so every
visual change receives a new cache key automatically.
"""

from __future__ import annotations

import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
READMES = [
    ROOT / "README.md",
    ROOT / "thesis/classic-academic/README.md",
    ROOT / "report/classic-academic/README.md",
    ROOT / "report/short-charter/README.md",
    ROOT / "cv/curve-academic/README.md",
]

IMAGE = re.compile(
    r"(?P<prefix>!\[[^\]]*\]\()"
    r"(?P<path>[^)\s?]+\.png)"
    r"(?:\?rev=[0-9a-f]{12})?"
    r"(?P<suffix>\))"
)


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()[:12]


for readme in READMES:
    text = readme.read_text(encoding="utf-8")

    def replace(match: re.Match[str]) -> str:
        relative = match.group("path")
        image = (readme.parent / relative).resolve()
        if not image.is_file():
            raise SystemExit(f"README preview target does not exist: {image}")
        return (
            f'{match.group("prefix")}{relative}?rev={digest(image)}'
            f'{match.group("suffix")}'
        )

    updated = IMAGE.sub(replace, text)
    if updated == text:
        raise SystemExit(f"No preview image references found in {readme}")
    readme.write_text(updated, encoding="utf-8")

print("README preview cache keys updated from PNG content hashes.")
