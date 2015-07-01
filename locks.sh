#!/bin/bash

if [ "$EUID" -ne 0 ]; then 
	echo "Your not root so piss off"
	exit 1
fi

echo "locked by" $USER "@" $(date +"%x %r %Z")
xscreensaver-command --lock
systemctl suspend
