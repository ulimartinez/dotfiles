#!/usr/bin/env python3

import i3ipc

# Create the Connection object that can be used to send commands and subscribe
# to events.
i3 = i3ipc.Connection()

workspaces = [ws['num'] for ws in i3.get_workspaces()]
for ws in workspaces:
    if ws % 2 == 0:
        i3.command("workspace {}, move workspace to output eDP-1".format(ws))
    else:
        i3.command("workspace {}, move workspace to output DP-2".format(ws))
