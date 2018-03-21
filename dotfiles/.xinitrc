#!/bin/sh

# .xinitrc for the masses
#
# This script sources executable xinit scripts from .config/xinitrc.d

for file in $CONFIG_DIR/.xinitrc.d/*
do
	if [ -f "$file" -a -x "$file" ]
	then
		source $(realpath $file)
	fi
done

# vim: set ft=sh:
