#!/bin/bash

log_dir="/home/vboxuser/Documents/log/"
backup_dir="/home/vboxuser/Documents/backup/"
occupancy_threshold=70
n=2
occupancy=$(df -h "$log_dir" | awk '{print $5}' | tail -1 | sed 's/%//')
if [[ $occupancy -gt $occupancy_threshold ]]; then
	files_to_archive=($(ls -1t "$log_dir"))
	files_to_archive=("${files_to_archive[@]:0:$n}")
	#mkdir -p "$backup_dir/log_archive_$(date +%Y%m%d%H%M)"
	tar vczf $backup_dir/log_archive_$(date +%Y%m%d%H%M).tar.gz -C "$log_dir" "${files_to_archive[@]}"
	rm -f "${files_to_archive[@]/#/$log_dir/}"
	echo "done!"
fi
