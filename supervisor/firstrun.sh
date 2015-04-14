#!/bin/sh

[ -e '/root/.firstrun/done' ] && exit 0

# wait for elasticsearch to start
sleep 8

for i in /root/.firstrun/kibana-config-*.json; do
    curl -sS -XPOST 'localhost:9200/_bulk' --data-binary "@$i"
    ret=$?
    [ $ret -ne 0 ] && exit $ret
done

touch '/root/.firstrun/done'

