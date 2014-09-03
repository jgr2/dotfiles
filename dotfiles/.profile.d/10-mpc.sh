#!/bin/sh

alias mpc='mpc -f "[%position%]: %file%"'

mpc_albums_by_artist () {
	mpc -f "%album%" find artist $1 | uniq
}

mpc_select () {
	mpc play "$(mpc playlist | nl | grep "$@" | head -n 1 | cut -f 1)"
}

# vim: set ft=sh:
