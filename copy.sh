#!/bin/sh

find . -name .git -a -prune \
	-o -name bak -a -prune \
	-o ! -name link.sh ! -name copy.sh ! -name README.md -type f \
		-exec cp -vur ~/{} ./ \;
