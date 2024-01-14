docker run -itd --name vengine-hadoopfs-build-ubuntu18-compile \
    --hostname vengine-hadoopfs \
    -v /mnt/d/Projects/docker/share:/share \
	vengine-hadoopfs-build:ubuntu18-compile