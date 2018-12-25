#!/usr/bin/env bash

check_sneaky_paths "$path"

function checkPass {
  FILE="$1"

  URL_LINE=$(pass "${FILE%.*}" | grep -i ^url:)

  case "$URL_LINE" in
    ""|*https:*) return ;;
    *http:*) echo "Insecure protocol -- ${FILE%.*} ($URL_LINE)" ;;
    *) echo "Unknown protocol -- ${FILE%.*} ($URL_LINE)"
  esac
}

function mapEntries {
  while read LINE; do
    checkPass "$LINE"
  done
}

pass git ls-files |\
  grep '.gpg$' |\
  mapEntries
