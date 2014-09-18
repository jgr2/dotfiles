#!/bin/sh

mpc_albums_by_artist () {
	mpc -f "%album%" find artist $1 | uniq
}

mpc_play_file () {
	mpc play "$(mpc -f "%file%" playlist | grep "$@" | head -n 1 | cut -d ':' -f 1)"
}

# vim: set ft=sh:
