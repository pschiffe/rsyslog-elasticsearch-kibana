FROM centos:7
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

COPY elasticsearch/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch

RUN yum -y upgrade \
    && yum -y install epel-release \
    && yum -y install \
        tar \
        supervisor \
        rsyslog \
        rsyslog-mmnormalize \
        rsyslog-elasticsearch \
        java-1.7.0-openjdk-headless \
        elasticsearch \
    && yum -y clean all

RUN mkdir -p /opt/kibana \
    && curl -sSL https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
    | tar -xzC /opt/kibana --strip 1 \
    && chown -R root: /opt/kibana

COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY supervisor/rsyslog.ini /etc/supervisord.d/rsyslog.ini
COPY supervisor/elasticsearch.ini /etc/supervisord.d/elasticsearch.ini
COPY supervisor/kibana.ini /etc/supervisord.d/kibana.ini
COPY supervisor/firstrun.ini /etc/supervisord.d/firstrun.ini

COPY supervisor/firstrun.sh /root/.firstrun/firstrun.sh
RUN chmod u+x /root/.firstrun/firstrun.sh

COPY rsyslog/rsyslog.conf /etc/rsyslog.conf
COPY rsyslog/00_normalize.conf /etc/rsyslog.d/00_normalize.conf
COPY rsyslog/10_elasticsearch.conf /etc/rsyslog.d/10_elasticsearch.conf
COPY rsyslog/rules.rb /etc/rsyslog.d/rules.rb

COPY elasticsearch/logging.yml /etc/elasticsearch/logging.yml
COPY elasticsearch/logstash-template.json /etc/elasticsearch/templates/logstash.json

COPY kibana/config.json /root/.firstrun/kibana-config.json

COPY kibana/kibana.sh /opt/kibana/bin/kibana.sh
RUN chmod +x /opt/kibana/bin/kibana.sh

VOLUME /var/lib/elasticsearch

EXPOSE 514 514/udp 5601

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

