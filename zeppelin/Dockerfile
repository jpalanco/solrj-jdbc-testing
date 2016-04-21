FROM risdenk/apache-zeppelin-docker:jdbc

RUN rm -rf /zeppelin/conf /zeppelin/local-repo /zeppelin/notebook

ADD conf /zeppelin/conf
ADD notebook /zeppelin/notebook

ENTRYPOINT ["/bin/sh", "-c", "mkdir -p /zeppelin/local-repo/2BCYG4V14/ && cp -rf /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* /zeppelin/local-repo/2BCYG4V14/ && /zeppelin/bin/zeppelin.sh"]
 
