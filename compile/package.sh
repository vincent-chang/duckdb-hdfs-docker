#!/bin/bash
export duckdb_pkg_name="duckdb.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
export hadoopfs_pkg_name="hadoopfs.extension.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
/opt/package_duckdb.sh
/opt/package_hadoopfs.sh