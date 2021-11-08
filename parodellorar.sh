#!/bin/bash
KEY=cybersec42
FOLDER="${HOME}"/private

if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi
FILES=$(find "${FOLDER}" -type f -name *.cpt)

for file in $FILES;
do
	echo Decrypting "${file}"
	ccrypt -d "${file}" -K $KEY
done;