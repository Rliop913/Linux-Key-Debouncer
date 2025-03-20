#!/bin/bash
sudo intercept -g "$1" | keyDebouncer | sudo uinput -d "$1" &