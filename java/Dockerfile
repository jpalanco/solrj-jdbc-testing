FROM maven:3-jdk-8-alpine

ADD solrj-jdbc-testing-java /solrj-jdbc-testing-java

WORKDIR /solrj-jdbc-testing-java

RUN mvn package

ADD scripts /scripts

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["select fielda, fieldb, fieldc, fieldd_s, fielde_i from test limit 10"]

