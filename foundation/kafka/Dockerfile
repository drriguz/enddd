FROM riguz/centos7-jdk:oracle-jdk-8

ENV ZOOKEEPER_SERVERS=localhost:2181

RUN wget https://mirrors.bfsu.edu.cn/apache/kafka/2.5.0/kafka_2.12-2.5.0.tgz && \
    tar -zxvf kafka_2.12-2.5.0.tgz -C /opt && \
    mv /opt/kafka_2.12-2.5.0 /opt/apache-kafka && \
    mkdir /opt/apache-kafka/logs && \
    rm -f kafka_2.12-2.5.0.tgz

COPY assets/server.properties /opt/apache-kafka/config
COPY assets/start.sh /opt/apache-kafka

RUN chmod +x /opt/apache-kafka/start.sh

WORKDIR /opt/apache-kafka

VOLUME ["/opt/apache-kafka/config", "/opt/apache-kafka/logs"]

ENTRYPOINT ["/opt/apache-kafka/start.sh"]

