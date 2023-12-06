#!/bin/bash
#Referenced by  jq_queries_for_bettercap.txt

jq -r '.[] |  select( .tag=="wifi.client.probe") | select( .data.vendor | . == "") | .time'  | cut -d\. -f1 | sort | uniq -c | sort -nr | awk '{print "{\"quantity\": \"" $1 "\", \"date\": \"" $2 "\"}"}' | jq -s . | jq '.[] | select(.quantity > "1")' | jq -r .date
