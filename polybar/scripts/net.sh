#!/bin/bash
TYPE=0
if [ "$TYPE" -eq "0" ]; then
    MCH="$(iw dev wlp1s0 link | sed -E 's/.*SSID: (.*)$/\1/;tx;d;:x')"
else
    MCH=$(ip addr show dev wlp1s0 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x')
fi
EMCH=$(echo $MCH | tr -d '[:blank:]')	  
if [ -z $EMCH ]; then
    echo ""
else
    echo $MCH
fi

	      
