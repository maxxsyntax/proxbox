# proxbox
## Passive data collection and analysis of IEEE 802.11 and 802.15
Probe Requets correlation with RSSI, proximity, geolocation, and burst level characteristics.  

## Prerequisites
bettercap
curl
airmon-ng
tcpdump
jq
python
geopy.geocoders import Nominatim
bash
screen
tmux
Wigle API key


## HOW TO
put wireless interface in monitor mode
run ./startup.sh



## Assumptions
Randomized Mac does not coincide with a known Vendor OUI

BLE MAC's are not randomized

Devices burst equally on each channel

