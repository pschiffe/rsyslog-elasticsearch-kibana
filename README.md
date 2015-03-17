# rsyslog-elasticsearch-kibana

[Docker](https://www.docker.com/) container for centralized logging based on [CentOS 7](http://www.centos.org/) with [rsyslog](http://www.rsyslog.com/), [elasticsearch](https://www.elastic.co/products/elasticsearch) and [kibana](https://www.elastic.co/products/kibana).

To get this image, pull it from [docker hub](https://registry.hub.docker.com/u/pschiffe/rsyslog-elasticsearch-kibana/):

```
# docker pull pschiffe/rsyslog-elasticsearch-kibana
```

Or, if you want to build this image yourself, clone the [github repo](https://github.com/pschiffe/rsyslog-elasticsearch-kibana) and run in directory with Dockerfile:

```
# docker build -t <username>/rsyslog-elasticsearch-kibana .
```

To run the image use:

```
# docker run -d -p 514:514 -p 514:514/udp -p 5601:5601 pschiffe/rsyslog-elasticsearch-kibana
```

Rsyslog listens on standard port 514 (both TCP and UDP) and kibana on TCP port 5601. To forward log messages from your system, configure rsyslog according to this [recipe](http://www.rsyslog.com/sending-messages-to-a-remote-syslog-server/) with appropriate address of running container. To test the running container from the host system you can use:

```
$ logger -n localhost 'log message from host'
```

Kibana is available via regular web browser on [http://localhost:5601](http://localhost:5601) address from the host system. On the first visit, `[logstash-]YYYY.MM.DD` index must be created.

Elasticsearch is storing data in [docker data volume](https://docs.docker.com/userguide/dockervolumes/) `/var/lib/elasticsearch`.

