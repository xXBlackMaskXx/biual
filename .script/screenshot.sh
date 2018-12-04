#!/usr/bin/env bash

killall -9 compton
compton -b
sleep 1
mkdir "$(xdg-user-dir PICTURES)"/Screenshot
scrot -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshot'
