#!/usr/bin/env bash

for SCRIPT in $(ls /opt/scripts/*.R)
do
  echo $SCRIPT
  Rscript $SCRIPT
done
