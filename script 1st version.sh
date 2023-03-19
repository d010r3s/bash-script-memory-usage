#!/bin/bash

log_dir="/LOG"
backup_dir="/BACKUP"
occupancy_threshold=70
occupancy=$(df -h "$log_dir" | awk '{print $5}' | tail -1 | sed 's/%//')
if [[ $occupancy -gt $occupancy_threshold ]]; then
  # Archive files in the backup directory
  tar -czf "$backup_dir/log_archive_$(date +%Y%m%d%H%M%S).tar.gz" "$log_dir"/*
  # Delete files in the log directory
  rm -rf "$log_dir"/*
fi
