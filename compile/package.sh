#!/bin/bash
export vengine_pkg_name="vengine.CentOS7_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tar.gz"
export hadoopfs_pkg_name="hadoopfs.extension.CentOS7_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tar.gz"
./package_vengine.sh
./package_hadoopfs.sh