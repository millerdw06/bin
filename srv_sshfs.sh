#!/bin/bash

args=$@

is_Mounted(){

	if [ -z `pgrep sshfs` ]; then
		echo "srv.home.....Mounted: No"
	else 
		echo "srv.home.....Mounted: Yes"
	fi
}
usrv() {
	if !( fusermount -u /home/dave/srv.home ); then
		exit 1
	fi
}
msrv(){
	if !( sshfs dave@srv.home:/home/dave /home/dave/srv.home ); then
		exit 1
	fi
}
#----------------------------------
do_mount(){
	if [ -z `pgrep sshfs` ]; then
		echo srv.home.....Mounting		
		msrv
	fi

}
do_unmount(){
	if [ -n `pgrep sshfs` ]; then
		echo srv.home.....Unmounting		
		usrv	
	fi
}
case $args in
     -m )      
		do_mount
       	;;

     -u )      
       		do_unmount
        ;;
     
     *)
        	
        ;;
esac
is_Mounted