#!/bin/sh
find . -maxdepth 1 \
	-name ".[^.]*" \
	! -name ".git*" \
	-exec ln -s ~/{} $1/{} \;

