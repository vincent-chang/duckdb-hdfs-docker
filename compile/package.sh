#!/bin/bash
export vengine_pkg_name="vengine.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
export hadoopfs_pkg_name="hadoopfs.extension.${OS_TAG}_$(arch).$(date +%Y%m%d).$(date +%H%M%S).tgz"
/opt/package_vengine.sh
/opt/package_hadoopfs.sh