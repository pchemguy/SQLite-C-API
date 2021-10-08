#!/bin/sh
#
#
set -euo pipefail
IFS=$'\n\t'

cleanup_EXIT() { 
  echo "EXIT clean up: $?" 
}
trap cleanup_EXIT EXIT

cleanup_TERM() {
  echo "TERM clean up: $?"
}
trap cleanup_TERM TERM

cleanup_ERR() {
  echo "ERR clean up: $?"
}
trap cleanup_ERR ERR



main() {
(
  pcre2grep -M '^ *([a-zA-Z][a-zA-Z_0-9 ]+ \**)([a-zA-Z][a-zA-Z_0-9]* )?(sqlite3[_a-zA-Z0-9]+)(\([^;{]*)' "./sqlite/build/sqlite3.h"
  return 0
) >sqlite3.h.APIn.txt
}


main "$@"

