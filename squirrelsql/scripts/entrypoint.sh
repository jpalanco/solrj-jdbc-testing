#!/usr/bin/env sh

LOCATIONS=$(ls /opt/solr/dist/solrj-lib/* /opt/solr/dist/solr-solrj-*.jar | awk '{print "<Bean Class=\"net.sourceforge.squirrel_sql.fw.util.beanwrapper.StringWrapper\"><string>" $0 "</string></Bean>"}' | sed -e 's/\//\\\//g' | sed -e 's/"/\\"/g' | tr -d '\n')

sed -i'' -e "s/LOCATION_REPLACE/$LOCATIONS/" /root/.squirrel-sql/SQLDrivers.xml

sh /squirrelsql/squirrel-sql.sh
