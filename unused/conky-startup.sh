#!/bin/bash

if [ "$(pidof conky)"  ]
then
	echo "already running"
	exit 0
else
	echo "starting conky"
	conky &
fi

exit 0
