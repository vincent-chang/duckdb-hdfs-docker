docker run -itd --name vengine-hadoopfs-build-ubuntu-compile \
	--mount type=bind,src=/media/psf/share,dst=/share \
	vengine-hadoopfs-build:ubuntu-compile