docker build --progress=plain \
    --build-arg OS_TAG=ubuntu18 \
    -t duckdb-hadoopfs-build:ubuntu18-compile .
