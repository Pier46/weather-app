#!/bin/bash

while :; do
    curl_status=$(curl -s -o /dev/null -w %{http_code} http://localhost:5601/api/status)
    echo -e $(date) "Kibana HTTP state: " $curl_status " (waiting for 200)"
    if [ $curl_status -eq 200 ]; then
        break
    fi
    sleep 5
done

while :; do
    status=$(curl localhost:5601/api/status | jq -r '.status.overall.state')
    echo -e $(date) "Kibana status: " $status " (waiting for green)"
    if [[ $status == "green" ]]; then
        curl -X POST -H "Content-Type: application/json" -d @/tmp/dashboard1.json http://localhost:5601/api/kibana/dashboards/import?exclude=index-pattern
        break
    fi
    sleep 5
done

while :; do
    status=$(curl localhost:5601/api/status | jq -r '.status.overall.state')
    echo -e $(date) "Kibana status: " $status " (waiting for green)"
    if [[ $status == "green" ]]; then
        curl -X POST -H "Content-Type: application/json" -d @/tmp/dashboard2.json http://localhost:5601/api/kibana/dashboards/import?exclude=index-pattern
        break
    fi
    sleep 5
done
