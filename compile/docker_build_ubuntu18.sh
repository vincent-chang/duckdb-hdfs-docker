docker build --progress=plain --no-cache \
    --build-arg OS_TAG=ubuntu18-base \
    -t vengine-hadoopfs-build:ubuntu18-compile .
