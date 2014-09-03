#!/bin/sh

if [ ! -x "$(which xflux)" ]
then
	[ -x ~/builds/xflux/xflux ] && ln -s ~/builds/xflux/xflux ~/.profile.d/bin/xflux
fi

# vim: ft=sh:
