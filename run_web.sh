#!/usr/bin/env bash

echo "Running Apache Zeppelin"
docker-compose up -d zeppelin;
sleep 5
open "http://localhost:$(docker-compose port zeppelin 8080 | cut -d':' -f2)"

echo "Running Hue"
docker-compose up -d hue;
sleep 5
open "http://localhost:$(docker-compose port hue 8888 | cut -d':' -f2)"

echo "Running RStudio"
docker-compose up -d rstudio;
sleep 5
open "http://localhost:$(docker-compose port rstudio 8787 | cut -d':' -f2)"

