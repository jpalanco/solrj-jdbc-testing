FROM r-base

RUN echo "export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/lib/amd64:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server" >> /root/.profile
RUN apt-get update && apt-get install -y openjdk-8-jdk
RUN su root -c "R CMD javareconf"
RUN su root -c "Rscript -e 'install.packages(\"RJDBC\", dep=TRUE)'"

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
