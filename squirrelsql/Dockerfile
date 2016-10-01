FROM openjdk:8-jdk-alpine

RUN apk add --no-cache ca-certificates wget && \
        update-ca-certificates

RUN apk --no-cache add ttf-dejavu

RUN wget -q -O tmp.zip http://downloads.sourceforge.net/project/squirrel-sql/1-stable/3.7.1-plainzip/squirrelsql-3.7.1-base.zip; unzip tmp.zip; rm tmp.zip; ln -nsf /squirrelsql-* /squirrelsql

RUN mkdir -p /drivers \
  && wget -q -O /drivers/avatica-1.8.0.jar https://repo.maven.apache.org/maven2/org/apache/calcite/avatica/avatica/1.8.0/avatica-1.8.0.jar

ADD squirrel-sql-prefs /root/.squirrel-sql

ADD scripts /scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]

