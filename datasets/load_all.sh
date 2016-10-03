#!/usr/bin/env bash

set -u
set -e

for x in $(find * -maxdepth 0 -type d); do
  echo "Loading $x"
  cd $x
  ./download.sh || true
  ./$x.sh
  cd -
done

