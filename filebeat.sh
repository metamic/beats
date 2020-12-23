#!/bin/bash

if [ -z "$1" ] && [ -z "$2" ]; then
    echo "Usage: ./filebeat.sh <container name> <log path>"
    exit 1
fi


source .env

if [ -z "$LOGSTASH_HOST" ]; then
    echo "set LOGSTASH_HOST ENV VARIABLE ex) export LOGSTASH_HOST=<YOUR HOST>"
    exit 1
fi


CONTAINER_NAME=$1
LOG_PATH=$2

if [ ! -d "$PWD/$1" ]; then
    cp -r $PWD/conf/filebeat $PWD/$1
else
    echo "$1 name already exists"
fi

sed -i "s/\$HOST/$LOGSTASH_HOST/g" $PWD/$1/filebeat.yml
sed -i "s/\$CONTAINER_NAME/$CONTAINER_NAME/g" $PWD/$1/docker-compose.yml
sed -i "s/\$FILEBEAT_VERSION/$FILEBEAT_VERSION/g" $PWD/$1/docker-compose.yml
sed -i "s#\$LOG_PATH#$LOG_PATH#g" $PWD/$1/docker-compose.yml

cd $1
docker-compose up --build -d
cd ..