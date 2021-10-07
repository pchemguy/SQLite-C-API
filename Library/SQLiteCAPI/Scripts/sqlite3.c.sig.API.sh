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
  pcre2grep -M '^SQLITE_API[^;{]*\);' "./sqlite/build/sqlite3.c"
  return 0
) >sqlite3.c.sig.API
}


main "$@"
