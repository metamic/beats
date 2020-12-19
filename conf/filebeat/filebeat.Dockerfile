ARG VERSION

FROM docker.elastic.co/beats/filebeat:${VERSION}

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
