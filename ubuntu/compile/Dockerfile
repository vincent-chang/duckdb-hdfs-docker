FROM vengine-hadoopfs-build:ubuntu-base
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG TZ=Asia/Shanghai
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    cd /opt && \
    git clone https://github.com/vincent-chang/libhdfs3.git libhdfs3-src && \
    mkdir -p /opt/libhdfs3-src/build && \
    cd /opt/libhdfs3-src/build && ../bootstrap && \
    make -j$(nproc) && \
    make install && \
    mv /opt/libhdfs3-src/dist /opt/libhdfs3 && \
    export LIBHDFS3_HOME=/opt/libhdfs3 && \
    cd /opt && \
    git clone -b v1.2.0 https://github.com/redis/hiredis.git && \
    cd hiredis && \
    make PREFIX=/usr -j$(nproc) && \
    make PREFIX=/usr install && \
    cd /opt && \
    git clone -b 1.3.11 https://github.com/sewenew/redis-plus-plus.git && \
    cd redis-plus-plus && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install && \
    cd /opt && \
    git clone --recurse-submodules -b vengine https://github.com/vincent-chang/duckdb-hdfs.git vengine-hadoopfs && \
    cd /opt/vengine-hadoopfs && \
    mkdir -p third_party/libhdfs3 && \
    ln -s /opt/libhdfs3/include/hdfs third_party/libhdfs3/hdfs && \
    mkdir -p third_party/redis++ && \
    ln -s /usr/local/include/sw third_party/redis++/sw

ADD package.sh /opt/
ADD package_vengine.sh /opt/
ADD package_hadoopfs.sh /opt/

RUN chmod +x /opt/package.sh && \
    chmod +x /opt/package_vengine.sh && \
    chmod +x /opt/package_hadoopfs.sh

WORKDIR "/opt"
CMD ["/bin/bash"]