#!/bin/bash
TYPE=1
if [ "$TYPE" -eq "0" ]; then
    iw dev wlp1s0 link | sed -E 's/.*SSID: (.*)$/\1/;tx;d;:x'
else
    ip addr show dev wlp1s0 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x'
fi
