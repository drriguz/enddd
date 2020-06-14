FROM centos:centos7

RUN rm -f /etc/yum.repos.d/CentOS-Base.repo && \
    curl https://mirrors.163.com/.help/CentOS7-Base-163.repo --output /etc/yum.repos.d/CentOS7-Base-163.repo && \
    yum -y upgrade && \
    yum -y update && \
    yum -y install wget && \
    yum -y clean all

# RUN curl -L -C - -b "oraclelicense=accept-securebackup-cookie" -O \

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    https://download.oracle.com/otn-pub/java/jdk/8u251-b08/3d5a2bb8f8d4428bbe94aed7ec7ae784/jre-8u251-linux-x64.rpm && \
    yum -y install jre-8u251-linux-x64.rpm && \
    yum -y clean all && \
    rm -f jre-8u251-linux-x64.rpm

ENV JAVA_HOME /usr/java/jre1.8.0_251-amd64
