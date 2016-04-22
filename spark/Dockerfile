FROM risdenk/r-base-docker

RUN apk --no-cache add bash python

RUN wget -qO- 'http://apache.claz.org/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz' | tar xvz -C / && ln -nsf /spark* /spark && rm /spark/lib/spark-examples-*.jar

ADD scripts /scripts

ENTRYPOINT /scripts/entrypoint.sh

