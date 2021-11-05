#!/bin/bash
for pos in ${home}/private/*;
do
	ccrypt -d $pos -K cybersec42
done;