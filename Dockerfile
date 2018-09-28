FROM openjdk:8

MAINTAINER Vadym Korol <vadym.korol@verbundo.com>

ADD apache-ant-1.9.7.tar.gz /opt/tools/
COPY flink-esb-2.0.0.linux.distribution.tar /opt/distribution
COPY build.xml /opt/distribution
COPY install.properties /opt/distribution

COPY ./.s2i/bin/ /usr/local/s2i

# Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

# Set the default user for the image, the user itself was created in the base image
USER 1001

EXPOSE 8443
EXPOSE 4848

CMD ["usage"]