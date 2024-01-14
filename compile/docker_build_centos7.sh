docker build --progress=plain \
    --build-arg OS_TAG=centos7 \
    -t duckdb-hadoopfs-build:centos7-compile .
