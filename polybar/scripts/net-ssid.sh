#!/bin/bash
MCH="$(iw dev wlp1s0 link | sed -E 's/.*SSID: (.*)$/\1/;tx;d;:x')"
EMCH=$(echo $MCH | tr -d '[:blank:]')	  
if [ -z $EMCH ] && [ "$(ip addr | grep bond0)" ]; then
	MCH="ETH"
fi
echo $MCH
