#!/bin/bash
MCH="$(iw dev wlp1s0 link | sed -E 's/.*SSID: (.*)$/\1/;tx;d;:x')"
EMCH=$(echo $MCH | tr -d '[:blank:]')	  
if [ -z $EMCH ] && [ "$(ip addr | grep bond0)" ]; then
	MCH="ETH"
elif [ "$(ip addr | grep enp58s0u1u2)" ] && [ "$(ip addr show dev enp58s0u1u2 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x' | tr -d '[:blank:]')" ]; then
	MCH="ETH"
fi
echo $MCH
