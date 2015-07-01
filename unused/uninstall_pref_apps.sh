#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi
#reflector --verbose --country 'United States' -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist
pacman -Rscn adwaita-icon-theme baobab evince gnome-calculator gnome-disk-utility gnome-system-log gnome-system-monitor file-roller gedit gnome-logs gnome-nettool gnome-photos seahorse
