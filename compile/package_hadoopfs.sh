#!/bin/bash
echo "Build Hadoop Extension..."
if [[ -z "$hadoopfs_pkg_name" ]]; then
    export hadoopfs_pkg_name="hadoopfs.extension.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
fi
cd /opt/vengine-hadoopfs
git pull
make release GEN=ninja -j$(nproc)
cd /opt/vengine-hadoopfs/build
mkdir hadoopfs
cp release/duckdb ./hadoopfs/
cp release/src/libduckdb.so ./hadoopfs/
cp release/extension/hadoopfs/hadoopfs.duckdb_extension ./hadoopfs/
ldd ./hadoopfs/hadoopfs.duckdb_extension \
    |grep -v libc.so| grep -v 'linux-vdso.so'| grep -v '/ld-linux-'| grep -v libdl.so \
    |grep -v libm.so| grep -v 'libpthread.so'| awk '{print $3}'|awk NF|awk '{printf("cp %s ./hadoopfs/\n",$0)}'|bash
tar -czvf $hadoopfs_pkg_name hadoopfs
mv $hadoopfs_pkg_name /opt/