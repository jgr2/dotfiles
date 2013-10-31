feh --bg-tile ~/bg.png
xcompmgr &
xrdb ~/.Xresources
xrdb -merge .Xscheme

exec dwm
