#!/bin/sh
find . -maxdepth 1 -name ".[^.]*" ! -name ".git" -exec cp -vur ~/{} ./ \;
