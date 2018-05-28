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
# check if all depenencies are installed
if [ $all -eq 0 ]; then
    echo "Missing dependencies, aborting"
    exit
else
    # make a symlink to home directory for every dependency
    #TODO: check if we have a config dir for the dependency
    for f in ${deps[*]}; do
	ln -sf $(pwd)/$f $HOME/.$f
    done
fi
# symlink all the files defined in homeconfigs.txt
line=$(head -n 1 "homeconfigs.txt")
for conf in $line; do
    ln -sf $(pwd)/$conf $HOME/$conf
done
	    
#special cases
check termite
if [ $all -eq 0 ]; then
    echo "Missing dependency termite, skipping"
    exit
else
  ln -sf $(pwd)/termite/config ~/.config/termite/config  
fi
ln -sf $(pwd)/libinput-gestures.conf ~/.config/libinput-gestures.conf
all=1

check emacs
if [ $all -eq 0 ]; then
    echo "Missing dependency emacs, skipping"
    exit
else
    ln -sf $(pwd)/emacs/emacs.d/ ~/.emacs.d
fi
all=1

#getty autologin
sudo ln -sf $(pwd)/.override.conf /etc/systemd/system/getty\@tty1.service.d/override.conf
