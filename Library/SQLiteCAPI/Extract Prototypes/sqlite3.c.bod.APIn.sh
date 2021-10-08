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
  pcre2grep -M -o1 -o2 -o3 -o4 '^ *([a-zA-Z][a-zA-Z_0-9 ]+ \**)([a-zA-Z][a-zA-Z_0-9]* )?(sqlite3[_a-zA-Z0-9]+)(\([^;{]*){' "./sqlite/build/sqlite3.c"
  return 0
) >sqlite3.c.bod.APIn.txt
}


main "$@"
