FROM risdenk/hue-docker

COPY hue.ini /usr/local/hue/desktop/conf/hue.ini
COPY desktop.db /usr/local/hue/desktop/desktop.db

RUN chown hue /usr/local/hue/desktop/desktop.db

