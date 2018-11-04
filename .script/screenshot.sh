#!/usr/bin/env bash

killall -9 compton
compton -b
sleep 1
scrot -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshot'
