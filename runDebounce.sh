#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Need SUDO"
	exit 1
fi

if [[ ! -e "$1" ]]; then
	echo "invalid eventname"
	exit 1
fi


(sudo intercept -g "$1" | keyDebouncer | sudo uinput -d "$1") &