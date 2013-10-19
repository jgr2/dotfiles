#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -m .Xresources
xrdb -m .Xschemes/mustang

VBoxClient-all & 

#cvt 1440 900 | tail -n 1 | sed -e 's/^.*"\([0-9]\{1,\}x[0-9]\{1,\}\)_[^"]*"/\"\1\"/' | xargs xrandr --newmode && xrandr --addmode VBOX0 "1440x900" &
#cvt 1368 768 | tail -n 1 | sed -e 's/^.*"\([0-9]\{1,\}x[0-9]\{1,\}\)_[^"]*"/\"\1\"/' | xargs xrandr --newmode && xrandr --addmode VBOX1 "1368x768" &
#xrandr --output VBOX0 --mode  1440x900 --output VBOX1 --mode 1368x768 --right-of VBOX0 &
xrandr --output VBOX0 --mode 1440x900 --output VBOX1 --mode 1366x768 --right-of VBOX0 &

feh --bg-tile bg/escher*.png &
xcompmgr &

exec dwm

