#!/bin/bash
for pos in ${home}/private/*;
do
	ccrypt -e $pos -K cybersec42
done;
