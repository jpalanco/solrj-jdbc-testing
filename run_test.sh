#!/usr/bin/env bash

for x in java jisql jython python r-base spark spark2;
do
  echo "Running $x"
  docker-compose run --rm $x;
done
