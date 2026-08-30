#!/usr/bin/env python3
"""Attach PNG content hashes to README preview URLs."""

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
    ROOT / "journal/nature/README.md",
    ROOT / "journal/elsevier/README.md",
    ROOT / "journal/acs/README.md",
    ROOT / "journal/kxtbcas/README.md",
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
    matches = list(IMAGE.finditer(text))
    if not matches:
        raise SystemExit(f"No preview image references found in {readme}")

    def replace(match: re.Match[str]) -> str:
        relative = match.group("path")
        image = (readme.parent / relative).resolve()
        if not image.is_file():
            raise SystemExit(f"README preview target does not exist: {image}")
        return f'{match.group("prefix")}{relative}?rev={digest(image)}{match.group("suffix")}'

    updated = IMAGE.sub(replace, text)
    readme.write_text(updated, encoding="utf-8")
    state = "updated" if updated != text else "already current"
    print(f"{readme.relative_to(ROOT)}: {len(matches)} preview reference(s), {state}.")

print("README preview cache keys verified against PNG content hashes.")
