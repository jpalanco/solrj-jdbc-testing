#!/usr/bin/env bash

set -u

SOLR="localhost:$(docker-compose port solr 8983 | cut -d':' -f2)"
COLLECTION="geonames"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"name","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"asciiname","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"alternatenames","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"latitude","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"longitude","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"featureclass","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"featurecode","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"countrycode","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"cc2","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"admin1code","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"admin2code","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"admin3code","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"admin4code","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"population","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"elevation","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"dem","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"timezone","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"modificationdate","type":"string","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat cities1000.txt | LC_ALL=C tr -d '"' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=id,name,asciiname,alternatenames,latitude,longitude,featureclass,featurecode,countrycode,cc2,admin1code,admin2code,admin3code,admin4code,population,elevation,dem,timezone,modificationdate&commit=true" --data-binary @- -H 'Content-type:application/csv'

