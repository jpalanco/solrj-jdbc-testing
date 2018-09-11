FROM risdenk/r-base-docker

RUN apk --no-cache add bash python

# Setup glibc for Spark SQL
RUN apk --no-cache add ca-certificates openssl && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
    apk --no-cache add glibc-2.28-r0.apk

RUN wget -qO- 'http://apache.claz.org/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz' | tar xvz -C / && ln -nsf /spark* /spark && rm -rf /spark/examples

ADD conf/hive-site.xml /spark/conf/hive-site.xml

ADD scripts /scripts

ENTRYPOINT /scripts/entrypoint.sh

