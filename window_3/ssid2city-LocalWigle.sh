#!/bin/bash
#IFS=\?
#apt-get install python3-geopy

python3 r_geocode.py `grep -am 1 "$*" wigle.csv | cut -d, -f8,9 | tr \, \  ` | cut -d\, -f1,2,3,4


