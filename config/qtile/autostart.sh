#!/bin/sh

# systray battery icon
cbatticon -u 5 &
# systray volume
volumeicon &
snow
picom --experimental-backends --backend glx &

# nitrogen --set-scaled --random ~/Pictures/Dracula\ Theme &
nitrogen --restore &

nm_applet &
