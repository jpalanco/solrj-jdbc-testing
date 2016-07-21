FROM risdenk/docker-solr:master

ADD sa_data /sa_data
ADD sa_conf /sa_conf

RUN /opt/solr/bin/solr start -c && sleep 5 && /opt/solr/bin/solr create -c test -d /sa_conf/ && sleep 5 && /opt/solr/bin/post -c test /sa_data/ && /opt/solr/bin/solr stop -all

EXPOSE 9983
EXPOSE 18983
CMD ["bash", "-c", "/opt/solr/bin/solr start -f -c -h solr -a '-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=18983'"]
