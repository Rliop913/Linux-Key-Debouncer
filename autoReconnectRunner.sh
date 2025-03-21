#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
	echo "Need SUDO"
	exit 1
fi

if [[ ! -e "$1" ]]; then
	echo "invalid eventname"
	exit 1
fi


(sudo intercept -g $1 | keyDebouncer | sudo uinput -d $1) &

eventName=$(echo "$1" | awk -F '/' '{print $4}') 

(
udevadm monitor --subsystem-match=input 2>&1 | \
	grep --line-buffered add | \
	grep --line-buffered KERNEL | \
	grep --line-buffered "$eventName" | \

	while read line; do
		(sudo intercept -g $1 | keyDebouncer | sudo uinput -d $1) &
	done
) &
