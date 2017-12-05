#!/bin/bash
TYPE=0
if [ "$TYPE" -eq "0" ]; then
    nmcli -t -f active,ssid dev wifi | sed -E 's/.*yes:(.*)/\1/;tx;d;:x'
else
    ifconfig wlo1 | sed -E 's/.*inet addr:(([0-9]*\.){3}[0-9]*).*/\1/;tx;d;:x'
fi
