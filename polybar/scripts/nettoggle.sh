#!/bin/bash
sed -i '2s/0/1/;tx;2s/1/0/;:x' $HOME/repos/dotfiles/polybar/scripts/net.sh
