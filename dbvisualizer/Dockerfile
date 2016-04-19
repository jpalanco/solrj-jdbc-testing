FROM java:8-jdk

RUN bash -c 'apt-get update && URL="https://www.dbvis.com/product_download/dbvis-9.2.15/media/dbvis_linux_9_2_15.deb"; FILE=`mktemp`; wget "$URL" -qO $FILE && dpkg -i $FILE; rm $FILE && apt-get install -f && apt-get clean && rm -rf /var/lib/apt/lists/*'

ADD dbvis_prefs /root/.dbvis

ADD scripts /opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint.sh"]
