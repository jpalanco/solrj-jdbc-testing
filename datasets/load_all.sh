#!/usr/bin/env bash

for x in $(find * -maxdepth 0 -type d); do
  echo "Loading $x"
  cd $x
  ./$x.sh
  cd -
done

