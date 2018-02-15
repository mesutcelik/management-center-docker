FROM openjdk:8u141-jre
ENV MC_VERSION 3.9.1
ENV MC_HOME /opt/hazelcast/mancenter
ENV MANCENTER_DATA /data
VOLUME ["/data"]

RUN mkdir -p $MC_HOME
WORKDIR $MC_HOME
ADD mancenter-3.9.3-SNAPSHOT.zip $MC_HOME/mancenter.zip
RUN unzip mancenter.zip
### Start Management Center standalone server.
COPY start.sh .
RUN chmod a+x start.sh
CMD ["/bin/sh", "-c", "./start.sh"]
EXPOSE 8080
