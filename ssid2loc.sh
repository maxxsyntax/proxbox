#!/bin/bash
APIKEY=WIGLE_API_KEY_HERE
#Accepts SSID Name as first parameter
#need to accomodate spaces
#need to notify on api limit reached
a="$1"

if [ ! -f locs/"$a".location ]
then
	echo File doesnt exist
curl -s -H 'Accept:application/json' -u $APIKEY --basic https://api.wigle.net/api/v2/network/search?ssid="$a" -o locs/"$a".location    

#else

#uncomment for debugging
#echo file exists
#       	egrep -o 'Results\"\:[0-9]' locs/"$a".location | tail -n1
fi
#curl -s -i -H 'Accept:application/json' -u $APIKEY --basic https://api.wigle.net/api/v2/network/search?ssid="$a" | tee -a locs/"$a".location


#jq '.results[] | select (.ssid==$a | .city'  locs/"$a".location
#
#
#query city(s) from location file
jq -M --arg ssid "$a" '.results[] | select (.ssid== $ssid) | .city'  locs/$a.location

exit 0
