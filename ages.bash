#!/usr/bin/env bash

check_sneaky_paths "$path"

function formatEntry {
  FILE="$1"

  DATES=$(pass git log --format="%cr" -- "$FILE")
  MODIFIED=$(head -1 <<< "$DATES")
  CREATED=$(tail -1 <<< "$DATES")
  LAST_GENERATED=$(pass git log -n 1 --format="%cr" --grep="generated" -- "$FILE")
  SORT="$(pass git log -n 1 --format="%aI" --grep="generated" -- "$FILE")"

  if [ -z "$LAST_GENERATED" ]; then
    LAST_GENERATED="-"
    SORT="0"
  fi

  printf "%s;%s;%s;%s;%s\n" "$SORT" "${FILE%.*}" "$LAST_GENERATED" "$MODIFIED" "$CREATED"
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
  sed -E 's/^[^;]+;//' |\
  column -t -s ';' -o ' | ' -N "Password,Last Generated,Last Modified,Created" /dev/stdin
