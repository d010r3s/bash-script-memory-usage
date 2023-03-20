#!/bin/bash

log_dir="/home/vboxuser/log2"
backup_dir="/home/vboxuser/backup"
occupancy_threshold=70
n=1
occupancy=$(df -h "$log_dir" | awk '{print $5}' | tail -1 | sed 's/%//')
if [[ $occupancy < $occupancy_threshold ]]; then
	files_to_archive=($(ls -1t "$log_dir"))
	files_to_archive=("${files_to_archive[@]:0:$n}")
	#mkdir -p "$backup_dir/log_archive_$(date +%Y%m%d%H%M)"
	tar -czf $backup_dir/log_archive_$(date +%Y%m%d%H%M).tar.gz ${files_to_archive[@]/#/log_dir/}
	rm -f "${files_to_archive[@]/#/$log_dir/}"
	echo "done!"
fi
