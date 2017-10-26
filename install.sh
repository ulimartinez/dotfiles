#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

col=80 # change this to whatever column you want the output to start at
deps=(i3 polybar rofi)
all=1
#check if a dependency exists
check(){
    if hash $@ 2>/dev/null; then
	echo "checking for $@"
	printf '%s%*s%s\n'  "$GREEN" $col "[OK]" "$NORMAL"
    else
	printf '%s%*s%s\n' "$RED" $col "[FAIL]" "$NORMAL"
	all=0
    fi
}
for i in ${deps[*]}; do
    check $i
done

if [ $all -eq 0 ]; then
    echo "Missing dependencies, aborting"
    exit
else
    for f in ${deps[*]}; do
	ln -sf $(pwd)/$f $HOME/.$f
    done
fi


#TODO: finish this plz
