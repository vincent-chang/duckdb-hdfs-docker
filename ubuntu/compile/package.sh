#!/bin/bash
export vengine_pkg_name="vengine.$(uname)_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tar.gz"
export hadoopfs_pkg_name="hadoopfs.extension.$(uname)_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tar.gz"
./package_vengine.sh
./package_hadoopfs.sh