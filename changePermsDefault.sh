#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi
currentPath=$(pwd)
echo 'changing directorys to 755'
if !( find $currentPath -type d -exec chmod 755 {} + ); 
then

  exit 1
fi

echo 'changing files 644'
if !( find $currentPath -type f -exec chmod 644 {} + ); 
then

  exit 1
fi


echo all good

