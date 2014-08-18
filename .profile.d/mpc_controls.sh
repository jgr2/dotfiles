#!/bin/sh
# vim: set ft=sh:

alias mpc='mpc -f "[%position%]: %file%"'

mpc_select () {
	mpc play "$(mpc playlist | nl | grep "$@" | head -n 1 | cut -f 1)"
}
