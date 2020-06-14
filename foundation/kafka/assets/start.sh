#! /bin/bash -e
sed -i "s/ZOOKEEPER_SERVERS/${ZOOKEEPER_SERVERS?}/" /opt/apache-kafka/config/server.properties

/opt/apache-kafka/bin/kafka-server-start.sh /opt/apache-kafka/config/server.properties