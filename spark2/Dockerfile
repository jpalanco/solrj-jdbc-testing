FROM risdenk/r-base-docker

RUN apk --no-cache add bash python

RUN wget -qO- 'http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz' | tar xvz -C / && ln -nsf /spark* /spark && rm -rf /spark/examples

ADD conf/hive-site.xml /spark/conf/hive-site.xml

ADD scripts /scripts

ENTRYPOINT /scripts/entrypoint.sh

