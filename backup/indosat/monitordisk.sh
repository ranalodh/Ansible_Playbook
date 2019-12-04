#!/bin/sh
# Shell script to monitor or watch the disk space
# It will send an email to $ADMIN, if the (free avilable) percentage 
# of space is >= 75% 
# -------------------------------------------------------------------------
# set admin email so that you can get email
#ADMIN="lranadip@gmail.com"
# set alert level 90% is default
#$0=Use % as parameter
ALERT=15
FILE_SYSTEM_NAME="/dev/xvda1"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  #echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ "$partition" = "$FILE_SYSTEM_NAME" ]; then
	if [ $usep -ge $ALERT ]; then
		echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)"
	else
		echo "No Match Found for supplied \"$partition ($usep%)\" on $(hostname) as on $(date)"
    fi 		
  else
    echo "No File system present with name \"$FILE_SYSTEM_NAME\" on $(hostname) as on $(date)"
  fi
done