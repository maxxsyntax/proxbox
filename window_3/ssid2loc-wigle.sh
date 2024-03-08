#!/bin/bash
APIKEY=""
a=`echo -n "$*" | jq -sRr @uri`

if [ ! -f locs/"$a".location ]
then
#	echo File doesnt exist
curl -s -H 'Accept:application/json' -u $APIKEY --basic https://api.wigle.net/api/v2/network/search?ssid="$a" -o locs/"$a".location    

else
echo $1
#uncomment for debugging
#echo file exists
 #      	egrep -o 'Results\"\:[0-9]' locs/"$a".location | tail -n1
fi
#curl -s -i -H 'Accept:application/json' -u $APIKEY --basic https://api.wigle.net/api/v2/network/search?ssid="$a" | tee -a locs/"$a".location


#jq '.results[] | select (.ssid==$a | .city'  locs/"$a".location
#
#

#jq -M --arg ssid "$a" '.results[] | select (.ssid== $ssid) | .city'  locs/$a.location
#cat locs/"$a".location | jq '.[]' | grep region | sort -u | cut -d\: -f2 | tr \\\n \, | egrep '^.'

x=`cat locs/"$a".location | jq '.[]' | grep -A 20 "$*" | grep -ci region 2>/dev/null`

if [[ $x -gt 3 ]]
then
	echo too many regions: $x
	cat locs/"$a".location | jq .[] | grep -i region | sort | uniq -c | sort -nr | head -n4 | tr -s \   | tr \\\n \ 
elif [[ $x -eq 0 ]]
then
	echo no regions in wigle
else
	echo -n $* && cat locs/"$a".location | jq '.[]' | grep -A 20 "$a" | tail -n2
fi
#
