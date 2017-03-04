#!/bin/sh
if [ $(i3-save-tree --workspace 2 | grep "class\": \"^Firefox"|wc -l) -lt 1 ];then
    i3-msg "workspace 2; append_layout ~/.i3/layouts/social.json; exec firefox -new-window messenger.com"
    #firefox -new-tab facebook.com
else
    i3-msg "workspace 2"
fi
