#!/bin/bash

killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar custom -c ~/.polybar/config & done
