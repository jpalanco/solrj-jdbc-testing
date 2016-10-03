#!/usr/bin/env bash

set -u
set -e

SOLR_BASE_VERSION=7.0.0
SOLR_BUILD_NUMBER=$(wget -qO- https://builds.apache.org/job/Solr-Artifacts-master/lastSuccessfulBuild/buildNumber)
SOLR_VERSION="${SOLR_BASE_VERSION}-${SOLR_BUILD_NUMBER}"
SOLR_URL="https://builds.apache.org/job/Solr-Artifacts-master/lastSuccessfulBuild/artifact/solr/package/solr-${SOLR_VERSION}.tgz"

OUTPUT_DIR=/Library/Java/Extensions

sudo rm -rf $OUTPUT_DIR/*
wget -qO- $SOLR_URL | sudo tar zx -C $OUTPUT_DIR/ - "solr-${SOLR_VERSION}/dist/solr-solrj-*.jar" "solr-${SOLR_VERSION}/dist/solrj-lib/*"
sudo mv $OUTPUT_DIR/solr-${SOLR_VERSION}/dist/*.jar $OUTPUT_DIR/solr-${SOLR_VERSION}/dist/solrj-lib/* $OUTPUT_DIR/
sudo rm -rf $OUTPUT_DIR/solr-${SOLR_VERSION} $OUTPUT_DIR/guava*.jar

ls -l $OUTPUT_DIR/

