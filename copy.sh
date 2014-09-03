#!/bin/sh

cd dotfiles

for file in $(find . -type f)
do
	cp -iu ~/"$file" "$(realpath $file)"
done

