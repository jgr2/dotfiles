#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb ~/.Xresources
xrdb -merge ~/.Xscheme

while sleep .25
do
	xsetroot -name "[ $(mpc -f " %file%" | head -n 2 | tac | tr -d '\n' | sed 's/^\[playing\] //') ] | [ $(date) ]"
done &

xcompmgr &

urxvtd -q -o -f
xflux -r 1 -l -26.7 -g 153.1

bg_change

~/.dwm/build.sh

$(which "$BROWSER") &
urxvtc -e mosh mindlock.us &

exec ~/.dwm/dwm/dwm

# vim: set ft=sh:
