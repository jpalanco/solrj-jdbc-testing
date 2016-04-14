FROM java:openjdk-8-jre

RUN curl 'http://apache.claz.org/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz' | tar xvz -C /opt/ && ln -nsf /opt/spark* /opt/spark

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh

