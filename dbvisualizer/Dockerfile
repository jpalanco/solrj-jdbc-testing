FROM java:8-jdk-alpine

RUN apk --no-cache add ttf-liberation

RUN wget -q https://www.dbvis.com/product_download/dbvis-9.2.15/media/dbvis_linux_9_2_15.sh -O /dbvis_linux_9_2_15.sh && sh /dbvis_linux_9_2_15.sh -q

ADD dbvis_prefs /root/.dbvis

ADD scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
