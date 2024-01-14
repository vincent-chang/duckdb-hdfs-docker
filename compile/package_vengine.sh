#!/bin/bash
echo "Build VEngine..."
if [[ -z "$vengine_pkg_name" ]]; then
    export vengine_pkg_name="vengine.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
fi
cd /opt/vengine-hadoopfs/duckdb
make release GEN=ninja -j$(nproc)
cd /opt/vengine-hadoopfs/duckdb/build
mkdir vengine
cp release/duckdb ./vengine/
cp release/src/libduckdb.so ./vengine/
ldd ./vengine/duckdb \
    |grep -v libc.so| grep -v 'linux-vdso.so'| grep -v '/ld-linux-'| grep -v libdl.so \
    |grep -v libm.so| grep -v 'libpthread.so'| awk '{print $3}'| awk NF| awk '{printf("cp %s ./vengine/\n",$0)}'|bash
tar -czvf $vengine_pkg_name vengine
mv $vengine_pkg_name /opt/