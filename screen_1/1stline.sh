#!/bin/bash
#first line

curl -s http://127.0.0.1:8081/api/events | jq -cj '.[-1] | select (.tag=="wifi.client.probe") |  {Name: .data.essid?, Signal: .data.rssi?}'


echo ""
#2nd line; 
#wifi.vendor or burst id
curl -s http://127.0.0.1:8081/api/events | jq -crj '.[-1] | select (.tag=="wifi.client.probe") |  {Vendor: .data.vendor?}'






echo ""
#3rd line;
#city or ble device
##!/bin/bash
curl -s http://127.0.0.1:8081/api/events | jq -cj '.[-1] | select (.tag=="ble.device.new") |  {Name: .data.name?, Vendor: .data.vendor?}'

# ssid 2 city
curl -s http://127.0.0.1:8081/api/events | jq -r '.[-1] | select (.tag=="wifi.client.probe") | [.data.essid] | @tsv' | while IFS=$'\t' read -r essid; do ./ssid2loc.sh "$essid"; done | sort | uniq -c | sort -nr | cut -d\" -f2 | head -n3
