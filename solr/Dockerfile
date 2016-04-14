FROM risdenk/docker-solr:master

ADD sa_data /opt/sa_data
ADD sa_conf /opt/sa_conf

RUN /opt/solr/bin/solr start -c && /opt/solr/bin/solr create -c test -d /opt/sa_conf/ && /opt/solr/bin/post -c test /opt/sa_data/ && /opt/solr/bin/solr stop -all

CMD ["bash", "-c", "/opt/solr/bin/solr start -f -c"]
