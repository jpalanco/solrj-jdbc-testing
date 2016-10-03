#!/usr/bin/env bash

#wget -O- http://apache.mirrors.lucidnetworks.net/lucene/solr/6.2.1/solr-6.2.1.tgz

set -u
set -e

SOLR_VERSION=6.2.1

OUTPUT_DIR=/Library/Java/Extensions

sudo rm -rf $OUTPUT_DIR/*
cat solr-${SOLR_VERSION}.tgz | sudo tar zx -C $OUTPUT_DIR/ - "solr-${SOLR_VERSION}/dist/solr-solrj-*.jar" "solr-${SOLR_VERSION}/dist/solrj-lib/*"
sudo mv $OUTPUT_DIR/solr-${SOLR_VERSION}/dist/*.jar $OUTPUT_DIR/solr-${SOLR_VERSION}/dist/solrj-lib/* $OUTPUT_DIR/
sudo rm -rf $OUTPUT_DIR/solr-${SOLR_VERSION} $OUTPUT_DIR/guava*.jar

ls -l $OUTPUT_DIR/

