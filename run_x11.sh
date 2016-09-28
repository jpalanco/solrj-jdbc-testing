#!/usr/bin/env bash

open -a xquartz
xhost +
export X11_DISPLAY=$(ipconfig getifaddr en0):0

for x in dbvisualizer squirrelsql;
do
  echo "Running $x"
  docker-compose up -d $x;
done

