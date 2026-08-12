#!/usr/bin/env bash

set -euo pipefail

ROOT="${1:-.}"

find "$ROOT" \
  -type f \
  -name '*.adoc' \
  -not -path '*/.git/*' \
  -print0 |
while IFS= read -r -d '' file; do
  awk '
    /^==+ / && NR > 1 && prev !~ /^[[:space:]]*$/ {
      printf "%s:%d: section heading follows nonblank content\n", FILENAME, NR
    }

    { prev = $0 }
  ' "$file"
done
