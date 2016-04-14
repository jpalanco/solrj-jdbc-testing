FROM rocker/rstudio

RUN echo "export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/lib/amd64:/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server" >> /home/rstudio/.profile
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-8-jdk
RUN R CMD javareconf
RUN Rscript -e 'install.packages("RJDBC", dep=TRUE)'

ADD scripts /opt/scripts
