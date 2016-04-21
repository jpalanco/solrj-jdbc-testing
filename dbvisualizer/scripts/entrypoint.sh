#!/usr/bin/env sh

LOCATIONS=$(ls /opt/solr/dist/solrj-lib/* | awk '{print "<Location type=\"dynamic\"><Path>" $0 "</Path></Location>"}' | sed -e 's/\//\\\//g' | sed -e 's/"/\\"/g' | tr -d '\n')
DRIVER_LOCATION=$(ls /opt/solr/dist/solr-solrj-*.jar | awk '{print "<Location type=\"dynamic\"><Path>" $0 "</Path><Classes><Class type=\"jdbc\">org.apache.solr.client.solrj.io.sql.DriverImpl</Class></Classes></Location>"}' | sed -e 's/\//\\\//g' | sed -e 's/"/\\"/g' | tr -d '\n')

sed -i'' -e "s/LOCATION_REPLACE/$LOCATIONS/" /root/.dbvis/config70/dbvis.xml
sed -i'' -e "s/DRIVER_REPLACE/$DRIVER_LOCATION/" /root/.dbvis/config70/dbvis.xml

/usr/local/bin/dbvis
