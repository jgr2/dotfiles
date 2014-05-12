# vim: set ft=sh:

xrdb ~/.Xresources
xrdb -merge ~/.Xscheme

while sleep .25;
do
	xsetroot -name "$(date)"
done &

xcompmgr &
urxvtd -q -o -f

feh --bg-scale ~/bg.png

exec ~/builds/dwm/dwm-6.0/dwm

