#!/bin/sh
for DOTFILE in .*
do
	ln -s $DOTFILE $1/$DOTFILE
done

