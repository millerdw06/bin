#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi
if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
else
    sudo pacman -Rns $(pacman -Qdtq)
fi
