# proxbox
## Data collection from  Probe Requests
Probe Requets correlation with RSSI, proximity, geolocation, and burst level characteristics.  See [Analysis of Wi-Fi Probe Request Bursts for Device Counting](https://scholarworks.calstate.edu/downloads/8w32rd03r)

A project, for fun, written in shell scripts and jq to query the bettercap api. 

## Assumptions
Randomized Mac does not coincide with a known Vendor OUI

BLE MAC's are not randomized

Devices burst equally on each channel

## ToDo
Sort by SIgnal Strengthy 

location for closet PR, BLE device type OR  burst/ triangulation possible

ssid2locs: allow spaces in essid

ssid2locs: notifiy on api limits reached

fix bug in burst flow: too many pr's sometimes

make burst flow more efficent

quick and easy output display
