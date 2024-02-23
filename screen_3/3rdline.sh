#!/bin/bash
PS1='$'
#run wigle local
#run wigle remote
# burst informaiton 
#saveoutput from bettercap

#get list of probe requests
curl -s http://127.0.0.1:8081/api/events | jq '.[]'  | jq -s '.[] | select(.tag=="wifi.client.probe") .data' | jq -r '.essid' | sort -u | while read line ; do
 python screen_3/r_geocode.py `grep -a -m1 "$line" wigle.csv | cut -d, -f 8-10| grep -Po '[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)' | tr \, \ ` 
echo -n $line \| \ 


./screen_3/ssid2loc-wigle.sh "$line"
#./ssid2loc3.sh "$line"
done

#| sed -e "s/ /b/g"`
path="$*"
echo -n Bursts found \|\  `find  $path -name '*[0-9].csv' -mmin -5 | head -n1` | grep -a not\ as  | cut -d\, -f7-99 | grep \, | sort -u
curl -s http://127.0.0.1:8081/api/events > $path/bettercap.json
