#!/usr/bin/env bash

echo "Running Apache Solr"
docker-compose up -d solr;
sleep 10

PORT_8983=$(docker-compose port solr 8983 | cut -d':' -f2 2>/dev/null)
PORT_9983=$(docker-compose port solr 9983 | cut -d':' -f2 2>/dev/null)

echo "HTTP port: $PORT_8983"
echo "ZK port: $PORT_9983"

open "http://localhost:${PORT_8983}"

