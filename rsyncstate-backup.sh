#!/bin/sh
DD=${1%/}
test -d "$DD" || { echo Folder not found; exit; }

rsync -ax --only-write-batch="$DD.state.rsync" "$DD/" "/dev/shm/nonexistent.$$/"
rm -f "$DD.state.rsync.sh"
