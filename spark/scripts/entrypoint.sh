#!/usr/bin/env bash

export SOLR_CP="$(echo $(ls /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/*) | tr ' ' ':')"

for SCRIPT in $(ls /opt/scripts/*.scala)
do
  /opt/spark/bin/spark-shell --master local[*] --verbose --driver-class-path $SOLR_CP --jars $(echo $SOLR_CP | tr ':' ',') -i $SCRIPT
done

