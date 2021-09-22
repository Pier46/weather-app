FROM docker.elastic.co/logstash/logstash:7.14.1
RUN rm -f /usr/share/logstash/config/pipelines.yml
ADD pipelines/ /usr/share/logstash/pipelines/
ADD pipelines.yml /usr/share/logstash/config/pipelines.yml