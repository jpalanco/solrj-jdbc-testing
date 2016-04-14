FROM maven:3-jdk-8

RUN apt-get update && apt-get install -y --no-install-recommends npm libfontconfig

RUN git clone https://github.com/apache/incubator-zeppelin.git /opt/zeppelin-src && cd /opt/zeppelin-src && mvn package -pl markdown,shell,jdbc,zeppelin-web,zeppelin-server,zeppelin-distribution -am -Pbuild-distr -DskipTests

RUN bash -c "tar zxvf /opt/zeppelin-src/zeppelin-distribution/target/zeppelin-*-SNAPSHOT.tar.gz -C /opt/"

RUN bash -c "rm -rf /opt/zeppelin-*-SNAPSHOT/conf && rm -rf /opt/zeppelin-*-SNAPSHOT/local-repo && rm -rf /opt/zeppelin-*-SNAPSHOT/notebook && mkdir -p /opt/zeppelin_data"

ADD conf /opt/zeppelin_data/conf
ADD notebook /opt/zeppelin_data/notebook

RUN bash -c "mv /opt/zeppelin_data/* /opt/zeppelin-*-SNAPSHOT/"

CMD ["/bin/bash", "-c", "cd /opt/zeppelin-*-SNAPSHOT && mkdir -p local-repo/2BCYG4V14/ && cp -rf /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* /opt/zeppelin-*-SNAPSHOT/local-repo/2BCYG4V14/ && /opt/zeppelin-*-SNAPSHOT/bin/zeppelin.sh"]
 
