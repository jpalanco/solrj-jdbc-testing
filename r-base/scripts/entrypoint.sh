#!/usr/bin/env sh

for SCRIPT in $(ls /opt/scripts/*.R)
do
  echo $SCRIPT
  Rscript $SCRIPT
done
