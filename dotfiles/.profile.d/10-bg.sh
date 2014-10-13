#!/bin/sh

bg_set () {
	rm -f ~/.bg
	ln -s ${1:=$(recent -n1 $DOWNLOADS)} ~/.bg
}

bg_change () {
	feh ${FEH_BG_OPT:---bg-fill} $($1:=~/.bg)
}
