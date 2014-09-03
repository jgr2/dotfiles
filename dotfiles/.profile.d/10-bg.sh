#!/bin/sh

last_dl () {
	ls -t ~/$DOWNLOADS/ | head -n 1
}

bg_change () {
	rm ~/.bg
	ln -s ${1:=$(last_dl)} ~/.bg
}

