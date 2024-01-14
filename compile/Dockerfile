ARG OS_TAG
FROM vengine-hadoopfs-build:${OS_TAG}-base
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG OS_TAG
ARG TZ=Asia/Shanghai
ARG CMAKE_VERSION=3.28.0-rc5
ARG OPENSSL_VERSION=1.1.1w
ARG PROTOBUF_VERSION=3.0.0-autogen-fix
SHELL ["/bin/bash", "-c"]
RUN echo "export OS_TAG=$OS_TAG" >> /etc/bashrc && \
    source /etc/bashrc && \
    curl -fSL "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz" -o /tmp/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz && \
    curl -fSL "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz" -o /tmp/openssl-${OPENSSL_VERSION}.tar.gz && \
    curl -fSL "https://github.com/vincent-chang/protobuf/archive/refs/tags/v${PROTOBUF_VERSION}.tar.gz" -o /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz && \
    tar -xzvf /tmp/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz -C /opt/ && \
    ln -s /opt/cmake-${CMAKE_VERSION}-linux-$(arch)/bin/* /usr/bin && \
    tar -xzvf /tmp/openssl-${OPENSSL_VERSION}.tar.gz -C /opt/ && \
    rm -f /tmp/openssl-${OPENSSL_VERSION}.tar.gz && \
    chown -R root:root /opt/openssl-${OPENSSL_VERSION} && \
    cd /opt/openssl-${OPENSSL_VERSION} && \
    ./config --prefix=/usr/local && \
    make -j$(nproc) && \
    make install && \
    tar -xzvf /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz -C /opt/ && \
    rm -f /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz && \
    chown -R root:root /opt/protobuf-${PROTOBUF_VERSION} && \
    cd /opt/protobuf-${PROTOBUF_VERSION} && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make -j$(nproc) && \
    make install && \
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

ADD entry_point.sh /root/
ADD package.sh /opt/
ADD package_vengine.sh /opt/
ADD package_hadoopfs.sh /opt/

RUN chmod +x /opt/package.sh && \
    chmod +x /opt/package_vengine.sh && \
    chmod +x /opt/package_hadoopfs.sh && \
    chmod +x /root/entry_point.sh

WORKDIR "/opt"
ENTRYPOINT [ "/root/entry_point.sh" ]
CMD ["/bin/bash"]