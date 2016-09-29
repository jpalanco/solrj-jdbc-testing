#!/usr/bin/env bash

# Must have XQuartz installed (https://www.xquartz.org/releases/index.html)
# Must be either <2.7.8 or >=2.7.10. (2.7.9 is broken https://bugs.freedesktop.org/show_bug.cgi?id=95379)
open -a xquartz
HOST_IP=$(ipconfig getifaddr en0)
xhost +$HOST_IP
export X11_DISPLAY=$HOST_IP:0

for x in dbvisualizer squirrelsql;
do
  echo "Running $x"
  docker-compose up -d $x;
done

