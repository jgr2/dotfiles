#!/bin/sh

cd dotfiles

for file in $(find . -type f)
do
	ln -s "$(realpath "$file")" ~/"$file"
done

