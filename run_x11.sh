#!/usr/bin/env bash

open -a xquartz
HOST_IP=$(ipconfig getifaddr en0)
xhost +$HOST_IP
export X11_DISPLAY=$HOST_IP:0

for x in dbvisualizer squirrelsql;
do
  echo "Running $x"
  docker-compose up -d $x;
done

