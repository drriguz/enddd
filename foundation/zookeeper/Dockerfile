FROM riguz/centos7-jdk:oracle-jdk-8

ENV JVMFLAGS="-Dzookeeper.4lw.commands.whitelist=ruok"

RUN wget https://mirrors.bfsu.edu.cn/apache/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz && \
    tar -zxvf apache-zookeeper-3.6.1-bin.tar.gz -C /opt && \
    mv /opt/apache-zookeeper-3.6.1-bin /opt/apache-zookeeper && \
    mkdir /opt/apache-zookeeper/data && \
    rm -f apache-zookeeper-3.6.1-bin.tar.gz
RUN yum -y install nmap-ncat && \
    yum -y clean all

COPY assets/zoo.cfg /opt/apache-zookeeper/conf

EXPOSE 2181 2888 3888

HEALTHCHECK --interval=5s --timeout=1s --retries=3 \
    CMD [ $(echo ruok | nc 127.0.0.1 2181) == "imok" ] || exit 1

WORKDIR /opt/apache-zookeeper

VOLUME ["/opt/apache-zookeeper/conf", "/opt/apache-zookeeper/data"]

ENTRYPOINT ["/opt/apache-zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
