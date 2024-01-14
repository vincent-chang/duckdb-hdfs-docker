#!/bin/bash
echo "Build Duckdb..."
if [[ -z "$duckdb_pkg_name" ]]; then
    export duckdb_pkg_name="duckdb.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
fi
cd /opt/duckdb-hadoopfs/duckdb
make release GEN=ninja -j$(nproc)
cd /opt/duckdb-hadoopfs/duckdb/build
mkdir duckdb
cp release/duckdb ./duckdb/
cp release/src/libduckdb.so ./duckdb/
ldd ./duckdb/duckdb \
    |grep -v libc.so| grep -v 'linux-vdso.so'| grep -v '/ld-linux-'| grep -v libdl.so \
    |grep -v libm.so| grep -v 'libpthread.so'| awk '{print $3}'| awk NF| awk '{printf("cp %s ./duckdb/\n",$0)}'|bash
tar -czvf $duckdb_pkg_name duckdb
mv $duckdb_pkg_name /opt/