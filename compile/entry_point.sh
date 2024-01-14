#!/bin/bash
source /etc/bashrc
ls /opt/duckdb.*.tgz > /dev/null 2>&1
duckdb=$?
if [[ "$duckdb" -ne 0 ]]; then
    /opt/package_duckdb.sh
fi
ls /opt/hadoopfs.*.tgz > /dev/null 2>&1
hadoopfs=$?
if [[ "$hadoopfs" -ne 0 ]]; then
    /opt/package_hadoopfs.sh
fi

if [[ $# -eq 0 ]]; then
    cmd=( "bash" )
else
    cmd=( "$@" )
fi

echo "Executing the command: ${cmd[@]}"
exec "${cmd[@]}"

