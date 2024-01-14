docker build --progress=plain \
    --build-arg OS_TAG=kylin10sp1 \
    -t duckdb-hadoopfs-build:kylin10sp1-compile .
