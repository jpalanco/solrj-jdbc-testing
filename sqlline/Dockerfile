FROM openjdk:8-jre-alpine

RUN apk --no-cache add bash

RUN mkdir -p /sqlline
ADD sqlline /sqlline
ADD https://repo1.maven.org/maven2/sqlline/sqlline/1.4.0/sqlline-1.4.0-jar-with-dependencies.jar /sqlline

ADD scripts /scripts

WORKDIR /sqlline

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["-u","jdbc:solr://solr:9983?collection=test","-n","user","-p","pass","-f","/scripts/queries.sql","--force=true"]

