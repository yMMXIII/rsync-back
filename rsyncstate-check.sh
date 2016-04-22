#!/bin/sh
DD=${1%/}
test -d "$DD" || { echo Folder not found; exit; }
test -f "$DD.state.rsync" || { echo Folder state file not found; exit; }

rsync -axnv  --delete --read-batch="$DD.state.rsync" "$DD" 2>&1 | grep -vE "^\(Skipping batched update|/$|^receiving incremental file list|^total size is .*speedup is|^sent .*received .*bytes/sec|rsync error: some files/attrs were not transferred" | sed -s -e "s/.No batched update for \"/Changed: /g" -e 's/"[)]$//g'
