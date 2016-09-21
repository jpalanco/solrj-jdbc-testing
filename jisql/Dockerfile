FROM openjdk:8-jre-alpine

RUN apk add --no-cache ca-certificates wget && \
        update-ca-certificates

ENV JISQL_VERSION 2.0.11
RUN mkdir -p /opt && wget -qO- https://www.xigole.com/software/jisql/build/jisql-${JISQL_VERSION}.tar.gz | tar xvz -C /opt/ && ln -s /opt/jisql-${JISQL_VERSION} /opt/jisql

ENV SLF4J_VERSION 1.7.7
ADD http://central.maven.org/maven2/org/slf4j/slf4j-simple/${SLF4J_VERSION}/slf4j-simple-${SLF4J_VERSION}.jar /opt/slf4j-simple-${SLF4J_VERSION}.jar

CMD ["/bin/sh", "-c", "export SOLRCP=$(echo /opt/solr/dist/solr-solrj* /opt/solr/dist/solrj-lib/* | tr ' ' ':') && java -cp /opt/jisql/lib/jisql-2.0.11.jar:/opt/jisql/lib/jopt-simple-3.2.jar:/opt/slf4j-simple-1.7.7.jar:${SOLRCP} com.xigole.util.sql.Jisql -user test -password test -driver org.apache.solr.client.solrj.io.sql.DriverImpl -cstring \"$JDBC\" -c \\; -query \"$QUERY\""]
