FROM risdenk/docker-solr:master-alpine

ADD sa_data /opt/sa_data
ADD sa_conf /opt/sa_conf
ADD scripts/setup_collection.sh /docker-entrypoint-initdb.d/setup_collection.sh

EXPOSE 9983
EXPOSE 18983
CMD ["bash", "-c", "/opt/solr/bin/solr start -f -c -a '-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=18983'"]
