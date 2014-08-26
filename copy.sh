#!/bin/sh

find . \
	-name "bak" -prune -o \
	-name ".git*" -prune -o \
		-type f \
		! -name README.md \
		! -name link.sh \
		! -name copy.sh \
		! -name ".*.swp" \
		-exec cp -vur ~/{} {} \;
