FROM openjdk:8-jdk-alpine

RUN apk --no-cache add ttf-dejavu

RUN wget -q -O tmp.zip http://downloads.sourceforge.net/project/squirrel-sql/1-stable/3.7.1-plainzip/squirrelsql-3.7.1-base.zip; unzip tmp.zip; rm tmp.zip; ln -nsf /squirrelsql-* /squirrelsql

ADD squirrel-sql-prefs /root/.squirrel-sql

ADD scripts /scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]

