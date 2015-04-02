#!/bin/sh

[ -e '/root/.firstrun/done' ] && exit 0

# wait for elasticsearch to start
sleep 8

curl -sS -XPOST 'localhost:9200/_bulk' --data-binary '@/root/.firstrun/kibana-config.json'
ret=$?

[ $ret -ne 0 ] && exit $ret

touch '/root/.firstrun/done'

