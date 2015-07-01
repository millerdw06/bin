#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi
echo mounting keep
if !( mtpfs /media/android -o allow_other ); 
then
  exit 1
fi
echo all good

