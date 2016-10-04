FROM openjdk:8-jre-alpine

RUN apk --no-cache add bash

ADD sqlline /sqlline

ADD scripts /scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["-u","jdbc:solr://solr:9983?collection=test","-n","user","-p","pass","-f","/scripts/queries.sql"]

