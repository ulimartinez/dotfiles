#!/bin/bash
if [[ $(i3-save-tree | grep -c dropdown) -ge 1 ]]; then
    i3-msg [instance="dropdown"] move scratchpad
else
    i3-msg scratchpad show, [instance="dropdown"] move position center
fi

