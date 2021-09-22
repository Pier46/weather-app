FROM docker.elastic.co/kibana/kibana:7.14.1
ADD dashboards/dashboard1.json /tmp/dashboard1.json
ADD dashboards/dashboard2.json /tmp/dashboard2.json
ADD dashboard_import.sh /tmp/dashboard_import.sh
RUN bash /tmp/dashboard_import.sh