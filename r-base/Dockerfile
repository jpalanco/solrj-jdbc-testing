FROM risdenk/r-base-docker

RUN Rscript -e 'install.packages("RJDBC", dep=TRUE)'

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
