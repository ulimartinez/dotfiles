#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    export WALL=$(ls ~/Images/backgrounds | shuf -n 1)
    exec startx
fi
