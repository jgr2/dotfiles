#!/bin/sh

if [ -d $HOME/.xinitrc.d ]
then
	for f in $HOME/.xinitrc.d/*
	do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# vim: set ft=sh:
