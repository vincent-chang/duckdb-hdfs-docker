docker run -itd --name vengine-hadoopfs-build-centos7-compile \
    --hostname vengine-hadoopfs \
    -v /mnt/d/Projects/docker/share:/share \
	vengine-hadoopfs-build:centos7-compile