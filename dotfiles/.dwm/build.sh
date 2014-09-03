#!/bin/sh

MAKE_OPTS="$MAKE_OPTS X11INC=/usr/include/X11 X11LIB=/usr/lib/X11"

alias Git="git -C $HOME/.dwm/dwm"
alias Make="make -C $HOME/.dwm/dwm $MAKE_OPTS"

clone() {
	if ! git clone http://git.suckless.org/dwm ~/.dwm/dwm
	then
		exit $?
	fi
}

patch() {
	for f in ~/.dwm/patches/*
	do
		Git apply $@ "$f"
	done
	unset f
}

unpatch () {
	Git apply -R
}

build() {
	if ! Make
	then
		exit $?
	fi
}

if [ $# -ne 0 ]
then
	case "$1" in
		"clone") clone;;
		"patch") patch;;
		"build") build;;
		"unpatch") unpatch;;
	esac
else # default run pattern:

	if [ ! -d "$HOME/.dwm/dwm" ]
	then
		clone
		patch
		build
	else
		Git fetch origin
		if [ $(Git rev-parse @) != $(Git rev-parse @{u}) ]
		then
			Git merge origin
		fi

		build
	fi
fi

