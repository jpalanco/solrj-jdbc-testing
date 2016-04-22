FROM python:2-alpine

RUN apk --no-cache add bash wget openjdk8-jre g++

RUN ln -s /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/server/libjvm.so /usr/lib/jvm/java-1.8-openjdk/jre/lib/amd64/libjvm.so

ENV SLF4J_VERSION 1.7.7
ADD http://central.maven.org/maven2/org/slf4j/slf4j-simple/${SLF4J_VERSION}/slf4j-simple-${SLF4J_VERSION}.jar /opt/slf4j-simple-${SLF4J_VERSION}.jar

RUN pip install JayDeBeApi

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
