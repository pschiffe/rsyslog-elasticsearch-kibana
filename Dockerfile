FROM centos:7
MAINTAINER "Peter Schiffer" <pschiffe@redhat.com>

COPY rsyslog/rsyslog-copr.repo /etc/yum.repos.d/rsyslog-copr.repo
COPY elasticsearch/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch

RUN yum -y --setopt=tsflags=nodocs upgrade \
    && yum -y --setopt=tsflags=nodocs install epel-release \
    && yum -y --setopt=tsflags=nodocs install \
        tar \
        supervisor \
        rsyslog \
        rsyslog-mmnormalize \
        rsyslog-elasticsearch \
        java-1.8.0-openjdk-headless \
        elasticsearch \
    && yum -y clean all # Mon Jun  8 18:11:27 UTC 2015

RUN mkdir -p /opt/kibana \
    && curl -sSL https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz \
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
COPY rsyslog/rules-audit.rb /etc/rsyslog.d/rules-audit.rb
COPY rsyslog/rules-httpderror.rb /etc/rsyslog.d/rules-httpderror.rb
COPY rsyslog/rules-krb5-kdc.rb /etc/rsyslog.d/rules-krb5-kdc.rb
COPY rsyslog/rules-ipa-389-access.rb /etc/rsyslog.d/rules-ipa-389-access.rb
COPY rsyslog/rules-ipa-389-errors.rb /etc/rsyslog.d/rules-ipa-389-errors.rb
COPY rsyslog/rules-sssd.rb /etc/rsyslog.d/rules-sssd.rb
COPY rsyslog/rules-authpriv.rb /etc/rsyslog.d/rules-authpriv.rb

COPY elasticsearch/logging.yml /etc/elasticsearch/logging.yml
COPY elasticsearch/logstash-template.json /etc/elasticsearch/templates/logstash.json

COPY kibana/config-base.json /root/.firstrun/kibana-config-base.json
COPY kibana/config-searches.json /root/.firstrun/kibana-config-searches.json
COPY kibana/config-visualizations.json /root/.firstrun/kibana-config-visualizations.json
COPY kibana/config-dashboards.json /root/.firstrun/kibana-config-dashboards.json

COPY kibana/kibana.sh /opt/kibana/bin/kibana.sh
RUN chmod +x /opt/kibana/bin/kibana.sh

VOLUME /var/lib/elasticsearch

EXPOSE 514 514/udp 5601

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

