#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo "Your not root so piss off"
	exit
fi

#variables
IFS=$','
BACKUP_MEDIA=/run/media/dave/USB20FD
BACKUP_DIRECTORY=$BACKUP_MEDIA/backup
LOCAL_LOG_DIRECTORY=/home/dave/bin/logs
LOCAL_LOG_FILE=backup.log

NFS_SERVER=srv.home
NFS_LOCAL_ROOT=/mnt
NFS_MOUNTS='keep,media'


BACKUP_TARGETS='/mnt/keep/dave/Documents,mnt/keep/dave/Pictures'



#functions

checkBackupMedia() {
	echo $(date) - 'Checking for Backup Media'

	if grep $BACKUP_MEDIA /etc/mtab > /dev/null 2>&1; then
		echo $(date) - 'Backup Media is present and mounted'
	else
		echo $(date) - 'Backup Media is not present or properly mounted'
		exit 1
	fi
}

mountNFS() {
	mount -t nfs $NFS_SERVER:$1 $NFS_LOCAL_ROOT/$1
	if [ -n $? ]; then
		echo $(date) - '$?'
	else
		echo $(date) - 'Mounted $1'
	fi
}

checkLocalMounts() {

	for i in $NFS_MOUNTS
       	do 

		if grep -qs '$NFS_LOCAL_ROOT$i' /proc/mounts; then
			echo $(date) - '$NFS_LOCAL_ROOT$i mounted'	
		else
			echo mounting $NFS_LOCAL_ROOT$i
			mountNFS $i	
		fi	

	done	
}

syncDir() {
	for i in $BACKUP_TARGETS 
	do
		echo $1**/ 
		echo $BACKUP_DIRECTORY
		rsync -Ravzh -delete $i/**/. $BACKUP_DIRECTORY
		echo $(date) - 'finsished backing up $?'
	
	done
}

#flow starts here
echo $(date) - 'Backup Script Started'
echo $(date) - 'Checking Backup Media'
checkBackupMedia
echo $(date) - 'Checking local Mounts'
checkLocalMounts
echo $(date) - 'Backing up Data'
syncDir

unset IFS
