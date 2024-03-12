#strongest 3 in last minute, tune to 18 for seconds
# BLE 
PS1=''
#
#while true; do x=`date +%Y-%m-%dT%H:%M:%S` && y=${x:0:16}; curl -s http://127.0.0.1:8081/api/events  | jq --arg y $y '.[] | select(.time | startswith ($y))' |  jq   -s '.[] | select(.tag=="wifi.client.probe")' | jq -s 'sort_by(.data.rssi) | .[-3:]' | jq -r '.[] | "\(.data.essid), \(.data.rssi), \(.data.vendor)"'; sleep 10; done | grep -v '\[\]'



#
while true; do x=`date +%Y-%m-%dT%H:%M:%S` && y=${x:0:15}; curl -s http://127.0.0.1:8081/api/events  | jq --arg y $y '.[] | select(.time | startswith ($y))' |  jq   -s '.[] | select(.tag=="ble.device.new")' | jq -s 'sort_by(.data.rssi) | reverse | .[-3:]' | jq -r '.[] | "\(.data.mac), \(.data.rssi), \(.data.vendor)"' | grep -v '\[\]'; sleep 10; clear; done
