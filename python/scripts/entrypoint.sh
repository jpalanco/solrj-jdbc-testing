#!/usr/bin/env bash

export CLASSPATH="$(echo $(ls /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/*) | tr ' ' ':')"

for SCRIPT in $(ls /opt/scripts/*.py)
do
  echo $SCRIPT
  python $SCRIPT
done
