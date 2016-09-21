FROM openjdk:jre-alpine

ENV JYTHON_VERSION 2.7.0

RUN apk --no-cache add curl bash \
 && curl -Lo jython-installer-${JYTHON_VERSION}.jar\
 "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/${JYTHON_VERSION}/jython-installer-${JYTHON_VERSION}.jar"\
 && java -jar jython-installer-${JYTHON_VERSION}.jar -s -t minimum -i mod -i ensurepip -d /usr/local/jython-${JYTHON_VERSION}\
 && rm -f jython-installer-${JYTHON_VERSION}.jar\
 && ln -s /usr/local/jython-${JYTHON_VERSION}/bin/* /usr/local/bin/

ADD scripts /opt/scripts

ENTRYPOINT /opt/scripts/entrypoint.sh
