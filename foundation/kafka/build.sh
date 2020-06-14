#! /bin/bash -e

docker build -t riguz/kafka:2.5.0 . --build-arg ZOOKEEPER_ADDRESS=localhost