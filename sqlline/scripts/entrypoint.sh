#!/usr/bin/env bash

cp -f /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* /sqlline/

exec /sqlline/sqlline "$@"

