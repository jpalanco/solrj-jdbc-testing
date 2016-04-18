FROM java:openjdk-8-jre

RUN apt-get update && apt-get install -y --no-install-recommends python r-base && rm -rf /var/lib/apt/lists/* && apt-get clean

RUN curl 'http://apache.claz.org/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz' | tar xvz -C /opt/ && ln -nsf /opt/spark* /opt/spark

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh

