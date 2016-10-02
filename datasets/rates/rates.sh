#!/usr/bin/env bash

set -u

SOLR="localhost:$(docker-compose port solr 8983 | cut -d':' -f2)"
COLLECTION="rates"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"zip","type":"int","indexed":true,"stored":true},
  "add-field":{"name":"eiaid","type":"int","indexed":false,"stored":true},
  "add-field":{"name":"utility_name","type":"string","indexed":true,"stored":true,"omitNorms":true},
  "add-field":{"name":"state","type":"string","indexed":true,"stored":true,"omitNorms":true},
  "add-field":{"name":"service_type","type":"string","indexed":false,"stored":true,"omitNorms":true},
  "add-field":{"name":"ownership","type":"string","indexed":false,"stored":true,"omitNorms":true},
  "add-field":{"name":"comm_rate","type":"double","indexed":true,"stored":true},
  "add-field":{"name":"ind_rate","type":"double","indexed":true,"stored":true},
  "add-field":{"name":"res_rate","type":"double","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

gzcat iouzipcodes2011.csv.gz | curl "http://$SOLR/solr/$COLLECTION/update?header=true&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

