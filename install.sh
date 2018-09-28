#!/bin/bash

export PATH=$PATH:./apache-ant-1.9.7/bin
export FLINK_ESB_HOME=/home/vadym/tools/mytools

ant clean

ant

echo Starting karaf
${FLINK_ESB_HOME}/flink-esb-2.0.0/bin/start

echo sleep 30s and copy file repository application
sleep 30
cp file.repository.cfg ${FLINK_ESB_HOME}/flink-esb-2.0.0/etc
cp resource_handlers.xml ${FLINK_ESB_HOME}/flink-esb-2.0.0/etc
sleep 5
cp file-repository_1.0.0.jar ${FLINK_ESB_HOME}/flink-esb-2.0.0/deploy
