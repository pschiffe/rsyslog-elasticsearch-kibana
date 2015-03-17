FROM centos:7
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch

COPY elasticsearch/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN yum -y upgrade \
    && yum -y install epel-release \
    && yum -y install \
        tar \
        supervisor \
        rsyslog \
        rsyslog-elasticsearch \
        java-1.7.0-openjdk-headless \
        elasticsearch \
    && yum -y clean all

RUN mkdir -p /opt/kibana \
    && curl -L https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz \
    | tar -xzC /opt/kibana --strip 1

COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY supervisor/rsyslog.ini /etc/supervisord.d/rsyslog.ini
COPY supervisor/elasticsearch.ini /etc/supervisord.d/elasticsearch.ini
COPY supervisor/kibana.ini /etc/supervisord.d/kibana.ini

COPY rsyslog/rsyslog.conf /etc/rsyslog.conf
COPY rsyslog/elasticsearch.conf /etc/rsyslog.d/elasticsearch.conf

COPY elasticsearch/logging.yml /etc/elasticsearch/logging.yml

VOLUME /var/lib/elasticsearch

EXPOSE 514 514/udp 5601

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

