#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[ -f ~/.xprofile ] && . ~/.xprofile

# Swap CAPS and ESC keys
setxkbmap -option caps:swapescape
