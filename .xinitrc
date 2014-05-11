feh --bg-scale ~/bg.png

while sleep 1; 
do
	xsetroot -name "$(date) $(cat /sys/class/power_supply/BAT0/capacity)"
done &

xcompmgr &
xrdb ~/.Xresources
xrdb -merge ~/.Xscheme

urxvtd -q -o -f

exec ~/builds/dwm/dwm-6.0/dwm
#exec gnome-session --session=gnome-classic
