FROM risdenk/r-base-docker

RUN apk --no-cache add bash python

RUN wget -qO- 'http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz' | tar xvz -C / && ln -nsf /spark* /spark && rm -f /spark/lib/spark-examples-*.jar

ADD scripts /scripts

ENTRYPOINT /scripts/entrypoint.sh

