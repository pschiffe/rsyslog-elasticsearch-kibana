# rsyslog-elasticsearch-kibana

[Docker](https://www.docker.com/) image for centralized logging based on [CentOS 7](http://www.centos.org/) with [rsyslog](http://www.rsyslog.com/), [elasticsearch](https://www.elastic.co/products/elasticsearch) and [kibana](https://www.elastic.co/products/kibana).

Contains several pre-configured dashboards for [freeIPA](http://www.freeipa.org/page/Main_Page) server - [User Logins](https://raw.githubusercontent.com/pschiffe/rsyslog-elasticsearch-kibana/master/doc/images/user-logins.png), [IPA Server Administration](https://raw.githubusercontent.com/pschiffe/rsyslog-elasticsearch-kibana/master/doc/images/ipa-server-administration.png), [IPA Server Health](https://raw.githubusercontent.com/pschiffe/rsyslog-elasticsearch-kibana/master/doc/images/ipa-server-health.png), [IPA Server Utilization](https://raw.githubusercontent.com/pschiffe/rsyslog-elasticsearch-kibana/master/doc/images/ipa-server-utilization.png) and [SSSD](https://raw.githubusercontent.com/pschiffe/rsyslog-elasticsearch-kibana/master/doc/images/sssd.png). Screencast is available on [youtube](https://youtu.be/7YjA6z5nE0I). For more information about this effort and how to configure FreeIPA servers and clients to send proper logs to this container, visit [this page](https://www.freeipa.org/page/Centralized_Logging).

To get this image, pull it from [docker hub](https://registry.hub.docker.com/u/pschiffe/rsyslog-elasticsearch-kibana/):

```
$ docker pull pschiffe/rsyslog-elasticsearch-kibana
```

Or, if you want to build this image yourself, clone the [github repo](https://github.com/pschiffe/rsyslog-elasticsearch-kibana) and in directory with Dockerfile run:

```
$ docker build -t <username>/rsyslog-elasticsearch-kibana .
```

To run the image use:

```
$ docker run -d -p 514:514 -p 514:514/udp -p 5601:5601 -v /etc/localtime:/etc/localtime:ro pschiffe/rsyslog-elasticsearch-kibana
```

Rsyslog listens on standard port 514 (both TCP and UDP) and kibana on TCP port 5601. To forward log messages from your system, configure rsyslog according to this [recipe](http://www.rsyslog.com/sending-messages-to-a-remote-syslog-server/) with appropriate address of running container. To test the running container from the host system you can use:

```
$ logger -n localhost 'log message from host'
```

Kibana is available via regular web browser on [http://localhost:5601](http://localhost:5601) address from the host system. Please note, that it can take up to 10 seconds for container to be ready after start.

Elasticsearch is storing data in [docker data volume](https://docs.docker.com/userguide/dockervolumes/) `/var/lib/elasticsearch`.

