#!/bin/bash

log_dir="/LOG"
backup_dir="/BACKUP"
occupancy_threshold=70
n=10
occupancy=$(df -h "$log_dir" | awk '{print $5}' | tail -1 | sed 's/%//')
if [[ $occupancy -gt $occupancy_threshold ]]; then
  # Sorting
  files_to_archive=($(ls -1t "$log_dir"))
  # Selecting
  files_to_archive=("${files_to_archive[@]:0:$n}")
  # Archiving
  tar -czf "$backup_dir/log_archive_$(date +%Y%m%d%H%M%S).tar.gz" "${files_to_archive[@]/#/$log_dir/}"
  # Deleting
  rm -f "${files_to_archive[@]/#/$log_dir/}"
fi
