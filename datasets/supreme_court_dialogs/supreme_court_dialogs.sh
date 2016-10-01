#!/usr/bin/env bash

set -u

SOLR="localhost:$(docker-compose port solr 8983 | cut -d':' -f2)"
DATASET="supreme_court_dialogs"
FILE_PREFIX="supreme."

FILE="conversations"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"case_id","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"utterance_id","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"after_previous","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"speaker","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"is_justice","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_vote","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"presentation_side","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"utterance","type":"text_en","indexed":true,"stored":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat ${FILE_PREFIX}${FILE}.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=case_id,utterance_id,after_previous,speaker,is_justice,justice_vote,presentation_side,utterance&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="outcome"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"case_id","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"winning_side","type":"string","indexed":true,"stored":true,"docValues":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat ${FILE_PREFIX}${FILE}.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=case_id,winning_side&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="votes"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"case_id","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_1","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_2","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_3","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_4","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_5","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_6","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_7","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_8","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"justice_name_side_voted_for_9","type":"string","indexed":true,"stored":true,"docValues":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat ${FILE_PREFIX}${FILE}.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=case_id,justice_name_side_voted_for_1,justice_name_side_voted_for_2,justice_name_side_voted_for_3,justice_name_side_voted_for_4,justice_name_side_voted_for_5,justice_name_side_voted_for_6,justice_name_side_voted_for_7,justice_name_side_voted_for_8,justice_name_side_voted_for_9&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'

FILE="gender"
COLLECTION="${DATASET}_${FILE}"

docker-compose exec solr bash -c "./bin/solr create -c $COLLECTION -d basic_configs"

curl -H 'Content-type:application/json' --data-binary '{
  "add-field":{"name":"speaker","type":"string","indexed":true,"stored":true,"docValues":true},
  "add-field":{"name":"gender","type":"string","indexed":true,"stored":true,"docValues":true}
}' "http://$SOLR/solr/$COLLECTION/schema"

cat ${FILE_PREFIX}${FILE}.txt | LC_ALL=C tr '\t' ' ' | LC_ALL=C tr -d '"' | sed -e 's/ +++$+++ /\t/g' | curl "http://$SOLR/solr/$COLLECTION/update?header=false&separator=%09&fieldnames=speaker,gender&rowid=id&commit=true" --data-binary @- -H 'Content-type:application/csv'


