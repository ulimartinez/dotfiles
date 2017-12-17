#!/bin/bash
TYPE=0
if [ "$TYPE" -eq "0" ]; then
    iw dev wlo1 link | sed -E 's/.*SSID: (.*)$/\1/;tx;d;:x'
else
    ip addr show dev wlo1 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x'
fi
