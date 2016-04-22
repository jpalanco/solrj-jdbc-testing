FROM java:8-jdk-alpine

RUN echo 'options(repos = c(CRAN = "http://cran.rstudio.com/"))' >> ~/.Rprofile
RUN apk --no-cache add build-base gfortran readline-dev perl
RUN wget -qO- http://cran.r-project.org/src/base/R-3/R-3.2.5.tar.gz | tar zvx -C / && cd R-3.2.5 && ./configure --with-x=no && make && make install && rm -rf /R-3.2.5

RUN R CMD javareconf

RUN Rscript -e 'install.packages("RJDBC", dep=TRUE)'

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
