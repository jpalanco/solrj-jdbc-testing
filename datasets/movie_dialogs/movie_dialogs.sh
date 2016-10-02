#!/usr/bin/env bash

set -u

SOLR="localhost:$(docker-compose port solr 8983 | cut -d':' -f2)"
DATASET="movie_dialogs"

FILE="movie_titles_metadata"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"movieID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movie_title","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movie_year","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"IMDB_rating","type":"double","indexed":true,"stored":true},
  "add-field":{"name":"num_IMDB_votes","type":"int","indexed":true,"stored":true},
  "add-field":{"name":"genres","type":"string","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat $FILE.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=movieID,movie_title,movie_year,IMDB_rating,num_IMDB_votes,genres&skip=genres&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="movie_characters_metadata"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"characterID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"character_name","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movieID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movie_title","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"gender","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"credits_pos","type":"string","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat $FILE.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=characterID,character_name,movieID,movie_title,gender,credits_pos&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="movie_lines"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"lineID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"characterID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movieID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"character_name","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"line","type":"text_en","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat $FILE.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=lineID,characterID,movieID,character_name,line&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="movie_conversations"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"characterID1","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"characterID2","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movieID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"utterances","type":"string","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat $FILE.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=characterID1,characterID2,movieID,utterances&skip=utterances&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="raw_script_urls"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"movieID","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"movie_title","type":"string","indexed":true,"stored":true},
  "add-field":{"name":"url","type":"string","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat $FILE.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=movieID,movie_title,url&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

