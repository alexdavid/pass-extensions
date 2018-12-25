#!/usr/bin/env bash

check_sneaky_paths "$path"

DATE="$@"

comm -23 \
  <(pass git ls-files | sort | grep '.gpg$') \
  <(pass git log --since "$DATE" --name-only --pretty=format: | sort) \
  ;
