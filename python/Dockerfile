FROM python:2

ADD jessie-backports.list /etc/apt/sources.list.d/

RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jdk g++ python-dev && rm -rf /var/lib/apt/lists/* && apt-get clean

ENV SLF4J_VERSION 1.7.7
ADD http://central.maven.org/maven2/org/slf4j/slf4j-simple/${SLF4J_VERSION}/slf4j-simple-${SLF4J_VERSION}.jar /opt/slf4j-simple-${SLF4J_VERSION}.jar

RUN wget -qO- https://pypi.python.org/packages/source/J/JPype1/JPype1-0.6.1.tar.gz | tar xvz -C /opt/ && cd /opt/JPype* && python setup.py install

RUN pip install JayDeBeApi

RUN echo "export CLASSPATH=\"$(echo /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* | tr ' ' ':')\"" >> /root/.profile

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
