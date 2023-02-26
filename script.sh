#!/bin/bash
par = 70.000 #parament of free space
freespace = `df -m |grep "/dev/sdb1" | awk '{print $4}'` #fiding free space
d = $(bc<<<"scale=3;$freespace/512")
x = $(bc<<<"scale=3;$d*100") #percent of free space
x = $(bc<<<"scale=3;100-$x") #percent of filled space

echo $y"%"

if [ $(echo "$y > $par" | bc) ]
then
	tar cf mytar.tar.gz --directory
	cp /dev/sdb1 /dev/sdb2
	rm -rf /dev/sdb1
fi