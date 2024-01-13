#!/bin/bash
echo "Build VEngine..."
if [[ -z "$vengine_pkg_name" ]]; then
    export vengine_pkg_name="vengine.$(uname)_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tar.gz"
fi
cd /opt/vengine-hadoopfs/duckdb
make release GEN=ninja -j$(nproc)
cd /opt/vengine-hadoopfs/duckdb/build
mkdir vengine
cp release/duckdb ./vengine/
cp release/src/libduckdb.so ./vengine/
ldd ./vengine/duckdb |grep -v libc| awk '{print $3}'|awk NF|awk '{printf("cp %s ./vengine/\n",$0)}'|bash
tar -czvf $vengine_pkg_name vengine
mv $vengine_pkg_name /opt/