#!/bin/bash

shortcut=$1

case shortcut in 
	-home )
              path="~/home" ;;
        -bin )
	     cd ~/bin ;;
        -aur )
	     cd ~/aur ;;
	-tor )
	     ~/torrents/finished ;;
	-dl )
	     ~/Downloads ;;
esac

    # ls -lh --group-directories-first  --color $path
    echo $path

