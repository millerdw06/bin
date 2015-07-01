#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi
currentPath=$(pwd)
echo 'changing directorys to 700'
if !( find $currentPath -type d -exec chmod 700 {} + ); 
then

  exit 1
fi

echo 'changing files 600'
if !( find $currentPath -type f -exec chmod 600 {} + ); 
then

  exit 1
fi


echo all good
