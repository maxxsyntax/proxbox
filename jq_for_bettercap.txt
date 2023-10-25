#Oct 25 2023
#Pull most recent SSID and RSSI 

curl -s http://127.0.0.1:8081/api/events | jq -cj '.[-1] | select (.tag=="wifi.client.probe") |  {Name: .data.essid?, Signal: .data.rssi?}'

#Query most recent Vendor 

curl -s http://127.0.0.1:8081/api/events | jq -crj '.[-1] | select (.tag=="wifi.client.probe") |  {Vendor: .data.vendor?}'

#Query most recent BLE Name and Vendor

curl -s http://127.0.0.1:8081/api/events | jq -cj '.[-1] | select (.tag=="ble.device.new") |  {Name: .data.name?, Vendor: .data.vendor?}'


#Most Recent SSID to City

curl -s http://127.0.0.1:8081/api/events | jq -r '.[-1] | select (.tag=="wifi.client.probe") | [.data.essid] | @tsv' | while IFS=$'\t' read -r essid; do ./ssid2loc.sh "$essid"; done | sort | uniq -c | sort -nr | cut -d\" -f2 | head -n3



#Burst Identification
##Works better with prerecorded output from bettercap api 
##1. pull timestamps, 2. cut to nearest second, 3. sort ant print number of probe requests in that second, with awk. 4. find seconds with more than one probe requests. 5 only output the date
## put following into burst.sh

jq -r '.[] |  select( .tag=="wifi.client.probe") | select( .data.vendor | . == "") | .time'  | cut -d\. -f1 | sort | uniq -c | sort -nr | awk '{print "{\"quantity\": \"" $1 "\", \"date\": \"" $2 "\"}"}' | jq -s . | jq '.[] | select(.quantity > "1")' | jq -r .date 



##1.Query timestamps with multiple probe requests and no vendor. 2. assign Burst identification number. 3. Count total number of SSID's. 4. output to json

 for d2 in `cat bettercap.json | ./burst.sh`; do jq --arg d2 "$d2" '.[] | select(.time | startswith($d2)) |   select( .data.vendor | . == "") | .data' bettercap.json ; done | jq  -n '[inputs] | to_entries | group_by(.value.mac) | map({id: ("burst" + (.[0].key + 1 | tostring)), mac: .[0].value.mac, essids: map(.value.essid), essid_count: map(.value.essid) | length})' | jq 'group_by(.id) | map({id: .[0].id, data: [.[] | {essid_count, mac: {mac}, essids}]})'

## Find Duration of bursts
...
