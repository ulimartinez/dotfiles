
EXT=DP-2
INT=eDP-1
xrandr --output $EXT --auto
ext_w=`xrandr | sed 's/^'"${EXT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
ext_h=`xrandr | sed 's/^'"${EXT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
int_w=`xrandr | sed 's/^'"${INT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
int_h=`xrandr | sed 's/^'"${INT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
off_w=`echo $(( ($int_w-$ext_w)/2 )) | sed 's/^-//'`

xrandr --output "${INT}" --auto --pos 0x0 --scale 1x1 --output "${EXT}" --auto --pos 0x"${int_w}" --scale 2x2 --right-of "${INT}" --panning 0x"${int_h}"
~/.i3/scripts/workspaces
~/.polybar/scripts/polybar.sh
./.custombg
