#!/usr/bin/env bash

wget -qO- -O tmp.zip http://download.geonames.org/export/dump/cities1000.zip && unzip -o tmp.zip && rm tmp.zip

