FROM risdenk/apache-zeppelin-docker:jdbc

RUN apk add --no-cache ca-certificates wget && \
        update-ca-certificates

RUN mkdir -p /drivers \
  && wget -q -O /drivers/avatica-1.8.0.jar https://repo.maven.apache.org/maven2/org/apache/calcite/avatica/avatica/1.8.0/avatica-1.8.0.jar

RUN rm -rf /zeppelin/conf /zeppelin/local-repo /zeppelin/notebook

ADD conf /zeppelin/conf
ADD notebook /zeppelin/notebook

ENTRYPOINT ["/bin/sh", "-c", "mkdir -p /zeppelin/local-repo/2BCYG4V14/ && cp -rf /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* /zeppelin/local-repo/2BCYG4V14/ && /entrypoint.sh"]
 
