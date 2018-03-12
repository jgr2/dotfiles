#!/bin/sh

# .profile for the masses
#
# This script loads executable configuration files from .config/profile.d and
# performs mission-critical actions only

export CONFIG_DIR=$HOME

for file in $CONFIG_DIR/.profile.d/*
do
	if [ -f "$file" -a -x "$file" ]
	then
		source $(realpath $file)
	fi
done

# vim: ft=sh:
