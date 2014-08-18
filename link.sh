#!/bin/sh
find . -maxdepth 1 -name ".[^.]*" ! -name ".git" -printf "%f\0" -exec ln -s ~/{} $1/{} \;

