FROM openjdk:8-jdk-alpine

RUN apk add --no-cache ca-certificates wget && \
        update-ca-certificates

RUN apk --no-cache add ttf-dejavu

ENV DBVISUALIZER_VERSION 9_5_2

RUN wget -q https://www.dbvis.com/product_download/dbvis-$(echo $DBVISUALIZER_VERSION | tr '_' '.')/media/dbvis_linux_${DBVISUALIZER_VERSION}.sh -O /dbvis_linux_${DBVISUALIZER_VERSION}.sh && sh /dbvis_linux_${DBVISUALIZER_VERSION}.sh -q && rm /dbvis_linux_${DBVISUALIZER_VERSION}.sh

ADD dbvis_prefs /root/.dbvis

ADD scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
