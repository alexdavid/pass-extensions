#!/usr/bin/env bash

check_sneaky_paths "$path"

function formatEntry {
  FILE="$1"
  
  ISO8601_DATE=$(pass git log -n 1 --pretty=format:%aI -- "$FILE")
  HUMAN_DATE=$(pass git log -n 1 --pretty=format:%cr -- "$FILE")

  printf "%s,%s,%s\n" "$ISO8601_DATE" "$FILE" "$HUMAN_DATE"
}

function mapEntries {
  while read LINE; do
    formatEntry "$LINE"
  done
}

pass git ls-files |\
  grep '.gpg$' |\
  mapEntries |\
  sort |\
  sed -E 's/[^,]+,([^,]+)\.gpg/\1/' |\
  column -t -s ',' -o ' - ' /dev/stdin
