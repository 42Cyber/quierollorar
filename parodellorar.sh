#!/bin/bash


FOLDER="${PWD}"/test

if [ ! -e "${FOLDER}"/.quierollorar ]; then
	exit
fi
FILES=$(find "${FOLDER}" -type f -name *.cpt)

for file in $FILES;
do
	echo Decrypting "${file}"
	ccrypt -d "${file}" -K cybersec42
done;