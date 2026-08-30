#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE_COMMIT="69adcab3e0d40e4e0eb42038f685cc6125050cc6"
BASE="https://raw.githubusercontent.com/cigit-zgy/sci-manuscript-skill/${SOURCE_COMMIT}/src/resources/journal_templates"

sync_file() {
  local source_path="$1"
  local target_path="$2"
  local expected_blob="$3"
  local target="${ROOT}/${target_path}"

  mkdir -p "$(dirname "$target")"
  if [[ ! -s "$target" ]]; then
    curl --fail --location --silent --show-error "${BASE}/${source_path}" -o "$target"
  fi

  local actual_blob
  actual_blob="$(git hash-object "$target")"
  if [[ "$actual_blob" != "$expected_blob" ]]; then
    echo "source checksum mismatch: ${target_path}" >&2
    echo "expected ${expected_blob}" >&2
    echo "actual   ${actual_blob}" >&2
    exit 1
  fi
}

sync_file "nature/sn-jnl.cls" "journal/nature/sn-jnl.cls" "d25f07cb51c685e90a4ab97e95479826289486d4"
sync_file "nature/sn-nature.bst" "journal/nature/sn-nature.bst" "4a5cc91c6e5dd59d574713784f327cae8b62a16c"

sync_file "elsevier/elsarticle.cls" "journal/elsevier/elsarticle.cls" "cf20bdff618262d43f67b260f04454a17e40dcb8"
sync_file "elsevier/elsarticle-num.bst" "journal/elsevier/elsarticle-num.bst" "8e1d553e2cb9b192fa8243da15d195c1b959647e"

sync_file "acs/achemso.cls" "journal/acs/achemso.cls" "a581b532ccdfaa93d331bf110dcfef097b4d105c"
sync_file "acs/achemso.dtx" "journal/acs/achemso.dtx" "0dd136d89ee123e614e4fd9b4c3d9457e3db6964"
sync_file "acs/LICENSE.md" "journal/acs/LICENSE.md" "861b528777b905484583344f7c0363538ef8b5c9"

sync_file "chinese/kxtbcas.cls" "journal/chinese/kxtbcas.cls" "e3f0119fffa25386b75329775e7049f9dadc47ff"
sync_file "chinese/kxtbcas-numeric.bst" "journal/chinese/kxtbcas-numeric.bst" "86dd8fac6a1ea1f71a53ca2386856d35b569e68a"

echo "Journal source files verified at sci-manuscript-skill commit ${SOURCE_COMMIT}."
