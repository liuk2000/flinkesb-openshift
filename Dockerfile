FROM openjdk:8

MAINTAINER Vadym Korol <vadym.korol@verbundo.com>

ADD apache-ant-1.9.13-bin.tar.gz /opt/tools/
COPY flink-esb-2.0.0.linux.distribution.tar.gz /opt/distribution/
COPY build.xml /opt/distribution/
COPY install.properties /opt/distribution/
RUN mkdir -p /opt/flink

#COPY ./.s2i/bin/ /usr/local/s2i

#LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

# Drop the root user and make the content of /opt/flink owned by user 1001
RUN chown -R 1001:1001 /opt/flink
RUN chown -R 1001:1001 /opt/distribution
RUN chown -R 1001:1001 /opt/tools

# Set the default user for the image, the user itself was created in the base image
USER 1001

RUN cd /opt/distribution && /opt/tools/apache-ant-1.9.13/bin/ant

EXPOSE 8443
EXPOSE 4848

CMD [ "/opt/flink/flink-esb-2.0.0/bin/start" ]