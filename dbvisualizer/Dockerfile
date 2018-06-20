FROM openjdk:8-jdk-alpine

# Upgrade to OpenJDK 8u141 from edge to avoid
# https://bugs.alpinelinux.org/issues/7372
RUN apk --no-cache upgrade openjdk8 --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted

RUN apk add --no-cache ca-certificates wget && \
        update-ca-certificates

RUN apk --no-cache add ttf-dejavu

ENV DBVISUALIZER_VERSION 10_0_13

RUN wget -q https://www.dbvis.com/product_download/dbvis-$(echo $DBVISUALIZER_VERSION | tr '_' '.')/media/dbvis_linux_${DBVISUALIZER_VERSION}.sh -O /dbvis_linux_${DBVISUALIZER_VERSION}.sh && sh /dbvis_linux_${DBVISUALIZER_VERSION}.sh -q && rm /dbvis_linux_${DBVISUALIZER_VERSION}.sh

RUN mkdir -p /drivers \
  && wget -q -O /drivers/avatica-1.8.0.jar https://repo.maven.apache.org/maven2/org/apache/calcite/avatica/avatica/1.8.0/avatica-1.8.0.jar

ADD dbvis_prefs /root/.dbvis

ADD scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
