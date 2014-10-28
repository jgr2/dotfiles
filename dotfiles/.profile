#!/bin/sh

if [ -d ~/.profile.d ]
then

# add user drop-in path, useful for local builds of things.
	[ ! -d ~/.profile.d/bin ] && mkdir ~/.profile.d/bin
	export PATH=~/.profile.d/bin:$PATH


# source init scripts
	for f in ~/.profile.d/*
	do
		[ -f "$f" -a -x "$f" ] && source $(realpath "$f")
	done
	unset f
fi

# vim: ft=sh:
