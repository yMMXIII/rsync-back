#!/bin/sh
DD=${1%/}
test -d "$DD" || { echo Folder not found; exit; }
test -f "$DD.state.rsync" || { echo Folder state not found; exit; }

rsync -axv  --delete --read-batch="$DD.state.rsync" "$DD" | grep -vE "^\(Skipping batched update|/$|^receiving incremental file list|^total size is .*speedup is|^sent .*received .*bytes/sec| -> "
