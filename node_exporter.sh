#!/bin/bash


cd /usr/local/src/

wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.1/node_exporter-1.0.0-rc.1.linux-amd64.tar.gz

cd .. && tar xf src/node_exporter-1.0.0-rc.1.linux-amd64.tar.gz

ln -sv /usr/local/node_exporter-1.0.0-rc.1.linux-amd64 /usr/local/node_exporter

nohup /usr/local/node_exporter/node_exporter &> /dev/null &

apt

if [ $? == 127 ]; then
    echo 'nohup /usr/local/node_exporter/node_exporter &> /dev/null &' >> /etc/rc.local
    chmod +x /etc/rc.local
else
    touch /etc/rc2.d/S01node_exporter
    echo 'nohup /usr/local/node_exporter/node_exporter &> /dev/null &' >> /etc/rc2.d/S01node_exporter
    echo 'exit 0' >> /etc/rc2.d/S01node_exporter
fi