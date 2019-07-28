#!/bin/sh

master_vol=$(aucatctl | grep "master" | cut -d "=" -f 2)

mute() {
	if [ $master_vol -eq 0 ]
	then
		aucatctl master=127
	else
		aucatctl master=0
	fi
}

up() {
	if [ $(expr $master_vol + $1) -lt 127 ]
	then
		expr $master_vol + $1 | xargs -I% aucatctl master=%
	else
		aucatctl master=127
	fi
}

down() {
	if [ $master_vol -gt $1 ]
	then
		expr $master_vol - $1 | xargs -I% aucatctl master=%
	else
		aucatctl master=0
	fi
}

case $1 in
	"mute")
		mute;;
	"up")
		up $2;;
	"down")
		down $2;;
esac
