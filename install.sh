#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

col=80 # change this to whatever column you want the output to start at

i3check() {
    if hash i3 2>/dev/null; then
	printf '%s%*s%s\n'  "$GREEN" $col "[OK]" "$NORMAL"
    else
	printf '%s%*s%s' "$RED" $col "[FAIL]" "$NORMAL"
    fi
}
printf '%s\n' "Checking for i3"
i3check
#TODO: finish this plz
