
EXT=DP-2
INT=eDP-1
xrandr --output $EXT --auto
ext_w=`xrandr | sed 's/^'"${EXT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
ext_h=`xrandr | sed 's/^'"${EXT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
int_w=`xrandr | sed 's/^'"${INT}"' [^0-9]* \([0-9]\+\)x.*$/\1/p;d'`
int_h=`xrandr | sed 's/^'"${INT}"' [^0-9]* [0-9]\+x\([0-9]\+\).*$/\1/p;d'`
let off_w=$ext_w*2
let total_w=$ext_w+$int_w
let max_h="$ext_h > $int_h ? $ext_h : $int_h"

xrandr --output "${EXT}" --scale 2x2 --mode ${ext_w}x${ext_h} --fb ${total_w}x${max_h} --pos 0x0 --output "${INT}" --scale 1x1 --pos "${off_w}"x0 
