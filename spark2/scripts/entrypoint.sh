#!/usr/bin/env sh

# Exclude jackson-* libraries since Spark 2.x thinks they are too old
export SOLR_CP="$(echo $(ls /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* | grep -v jackson) | tr ' ' ':')"

for SCRIPT in $(ls /scripts/*.scala)
do
  echo $SCRIPT
  /spark/bin/spark-shell --master local[*] --verbose --driver-class-path $SOLR_CP --jars $(echo $SOLR_CP | tr ':' ',') -i $SCRIPT
done

for SCRIPT in $(ls /scripts/*.py /scripts/*.R)
do
  echo $SCRIPT
  /spark/bin/spark-submit --master local[*] --verbose --driver-class-path $SOLR_CP --jars $(echo $SOLR_CP | tr ':' ',') $SCRIPT
done

for SCRIPT in $(ls /scripts/*.sql)
do
  echo $SCRIPT
  /spark/bin/spark-sql --master local[*] --verbose --driver-class-path $SOLR_CP --jars $(echo $SOLR_CP | tr ':' ',') -i $SCRIPT
done

