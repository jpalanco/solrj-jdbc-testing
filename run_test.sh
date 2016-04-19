#!/usr/bin/env bash

for x in jisql jython python r-base spark;
do
  echo "Running $x"
  docker-compose run --rm $x;
done
