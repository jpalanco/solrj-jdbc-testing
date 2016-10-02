FROM risdenk/apache-zeppelin-docker:jdbc

RUN rm -rf /zeppelin/conf /zeppelin/local-repo /zeppelin/notebook

ADD conf /zeppelin/conf
ADD notebook /zeppelin/notebook

ENTRYPOINT ["/bin/sh", "-c", "cp -f /opt/solr/dist/solr-solrj-*.jar /solr-solrj.jar && mkdir -p /zeppelin/local-repo/2BCYG4V14/ && cp -rf /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* /zeppelin/local-repo/2BCYG4V14/ && /entrypoint.sh"]
 
