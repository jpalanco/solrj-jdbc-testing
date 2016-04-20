FROM python:2-alpine

RUN apk --no-cache add bash wget openjdk8-jre g++ python-dev && ln -s /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server/libjvm.so /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/libjvm.so

ENV SLF4J_VERSION 1.7.7
ADD http://central.maven.org/maven2/org/slf4j/slf4j-simple/${SLF4J_VERSION}/slf4j-simple-${SLF4J_VERSION}.jar /opt/slf4j-simple-${SLF4J_VERSION}.jar

RUN wget -qO- https://pypi.python.org/packages/source/J/JPype1/JPype1-0.6.1.tar.gz | tar xvz -C /opt/ && cd /opt/JPype* && python setup.py install

RUN pip install JayDeBeApi

RUN echo "export CLASSPATH=\"$(echo /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* | tr ' ' ':')\"" >> /root/.profile

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
