#!/usr/bin/env sh

SOLRJ_CLASSPATH="$(echo $(ls /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/*) | tr ' ' ':')"

exec java -cp $SOLRJ_CLASSPATH:target/solrj-jdbc-testing-java-1.0-SNAPSHOT.jar org.apache.solr.client.solrj.SolrJJDBCTestingJava "$@"

