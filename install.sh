#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

col=80 # change this to whatever column you want the output to start at

check(){
    if hash $@ 2>/dev/null; then
	printf '%s%*s%s\n'  "$GREEN" $col "[OK]" "$NORMAL"
    else
	printf '%s%*s%s\n' "$RED" $col "[FAIL]" "$NORMAL"
    fi
}
printf '%s\n' "Checking for i3"
check i3
printf '%s\n' "Checking for polybar"
check polybar
#TODO: finish this plz
