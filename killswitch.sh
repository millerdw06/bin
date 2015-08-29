#!/bin/bash

while :
do
    if [ -z "$(ip link | grep tun0)" ]; then
        if [ -n "$(pidof transmission-daemon)" ]; then
            kill -9 $(pidof transmission-daemon)
        fi
    fi
    sleep 1
done


