#!/bin/bash
MCH=$(ip addr show dev wlp1s0 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x')
EMCH=$(echo $MCH | tr -d '[:blank:]')	  
if [ -z $EMCH ] && [ "$(ip addr | grep bond0)" ]; then
    MCH=$(ip addr show dev bond0 | sed -E 's/.*inet (([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x')
fi
echo $MCH
