#!/bin/sh

if [ -n $FORCE_REBUILD ]
then
	FORCE="-B"
fi

> ~/.dwm/errors
exec 2> ~/.dwm/errors

rebuild() {
	cp ~/.dwm/config.def.h ~/.dwm/dwm-git/
	for f in ~/.dwm/patches/*
	do
		patch -Nfsd ~/.dwm/dwm-git/ < $f
	done
	unset f

	make $FORCE -C ~/.dwm/dwm-git/ X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

if [ ! -d ~/.dwm/dwm-git ]
then
	if git clone http://git.suckless.org/dwm ~/.dwm/dwm-git
	then
		rebuild
	fi
elif git -C ~/.dwm/dwm-git/ pull origin
then
	rebuild
fi


