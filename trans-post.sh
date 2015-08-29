#!/bin/bash

#vars
LOCAL_DIR='/home/dave/torrents/finished/'
SRV_DIR='/home/dave/srv.home/torrents'

#functions
do_chown(){
    chown -R dave:plex $LOCAL_DIR
}

do_perms(){
    find $LOCAL_DIR -type d -exec chmod 755 {} +
    find $LOCAL_DIR -type f -exec chmod 644 {} +
}

move_files(){
    sh /home/dave/bin/srv_sshfs.sh -m
    sudo -u dave rsync -a $LOCAL_DIR $SRV_DIR
}
#flow
do_chown
do_perms
move_files

