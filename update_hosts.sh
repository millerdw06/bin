#!/bin/bash
URL="http://hosts-file.net"
TMP_DIR="/tmp/hosts_file"
HOST_FILES="exp ad_servers"
CURRENT_HOST_FILES=/home/dave/dnsmasq
WHITE_LIST_DIR=$CURRENT_HOST_FILES/white_lists

if [ ! -d "$TMP_DIR" ]; then
    mkdir -p  $TMP_DIR
fi

if [ ! -d "$CURRENT_HOST_FILES" ]; then
    mkdir -p $CURRENT_HOST_FILES
fi

for i in $HOST_FILES
do
    TARGET_FILE=${i}.txt

    if [ -a $CURRENT_HOST_FILES/$i ]; then
        CURRENT_HEADER=$(head -n 1 $CURRENT_HOST_FILES/$i | cut -d "#" -f 2)
    else
        CURRENT_HEADER=" "
    fi

    LATEST_HEADER=`curl -I -silent $URL/$TARGET_FILE | grep "Last-Modified:"`
    
    if [ "$CURRENT_HEADER" != "$LATEST_HEADER" ]; then
        wget -O $TMP_DIR/$TARGET_FILE $URL/$TARGET_FILE
        sed -i "1i#$LATEST_HEADER" "$TMP_DIR/$TARGET_FILE"
        if [ -a $WHITE_LIST_DIR/$i ]; then
            while IFS='' read -r line; do
               sed --in-place "/${line}/d" "$TMP_DIR/$TARGET_FILE"
           done < $WHITE_LIST_DIR/$i
        fi

        if [ -a $CURRENT_HOST_FILES/$i ]; then
            mv $CURRENT_HOST_FILES/$i $CURRENT_HOST_FILES/$i.old
        fi
        cp $TMP_DIR/$TARGET_FILE $CURRENT_HOST_FILES/$i
    
    fi
   echo ----------------------- 
done

rm -rf $TMP_DIR

