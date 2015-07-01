#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi

echo 'mounting media'

if !( mount --bind /mnt/media/Video /home/dave/Video ); 
then

  exit 1
fi

echo 'mounting ISO'
if !( mount --bind /mnt/media/ISO /home/dave/ISO ); 
then

  exit 1
fi

echo all good

