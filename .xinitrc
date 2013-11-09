feh --bg-tile ~/bg.png

while sleep 1; 
do
	xsetroot -name "$(date) $(cat /sys/class/power_supply/BAT0/capacity)"
done &

xcompmgr &
xrdb ~/.Xresources
xrdb -merge .Xscheme

exec dwm
