#!/usr/bin/env bash

echo "Running Apache Solr"
docker-compose up -d solr;
sleep 10
open "http://localhost:$(docker-compose port solr 8983 | cut -d':' -f2)"

