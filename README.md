# proxbox
## Data collection from  Probe Requests
Probe Requets correlation with RSSI, proximity, geolocation, and burst level characteristics.  See [Analysis of Wi-Fi Probe Request Bursts for Device Counting](https://scholarworks.calstate.edu/downloads/8w32rd03r)

A project, for fun, written in shell scripts and jq to query the bettercap api. 



https://www.researchgate.net/figure/The-difference-between-the-clusters-and-the-devices-is-shown-in-the-left-graph-The_fig1_367065691

https://mrncciew.com/2014/10/27/cwap-802-11-probe-requestresponse/

https://blog.samcater.com/capturing-beacons-and-probe-requests-of-public-wifi-access-points-the-why-how-and-stats/

https://www.wireshark.org/docs/dfref/w/wlan.html

https://coggle.it/diagram/XuOp3Caim0QCKRfN/t/802-11-framing-in-detail-image



## Assumptions
Randomized Mac does not coincide with a known Vendor OUI

BLE MAC's are not randomized

Devices burst equally on each channel

~~## ToDo~~  Moved to Issues
~~Sort by SIgnal Strength~~

~~location for closet PR, BLE device type OR  burst/ triangulation possible~~

~~ssid2locs: allow spaces in essid~~

~~ssid2locs: notifiy on api limits reached~~

~~fix bug in burst flow: too many pr's sometimes~~

~~make burst flow more efficent~~

~~quick and easy output display~~
