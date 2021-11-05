#!/bin/bash
sudo su
apt get-install ccrypt
mkdir ${home}/private
mv example_dir/* ${home}/private/
chmod 777 ${home}/private
for pos in ${home}/private/*;
do
	ccrypt -e $pos -K cyber
done;
