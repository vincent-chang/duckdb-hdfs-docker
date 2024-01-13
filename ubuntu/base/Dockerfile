FROM ubuntu:18.04
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ARG CMAKE_VERSION=3.28.0-rc5
ARG PROTOBUF_VERSION=3.0.0-autogen-fix
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    echo 'Acquire::Retries "10";' > /etc/apt/apt.conf.d/80-retries && \
    apt-get update && \
    apt-get install -y git software-properties-common curl unzip \
        build-essential gcc g++ make automake autoconf ninja-build \
        dpkg-dev debhelper libxml2-dev uuid-dev libssl-dev \
        libgtest-dev libkrb5-dev libgsasl7-dev libboost-all-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -fSL "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz" -o /tmp/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz && \
    curl -fSL "https://www.openssl.org/source/openssl-1.1.1w.tar.gz" -o /tmp/openssl-1.1.1w.tar.gz && \
    curl -fSL "https://github.com/vincent-chang/protobuf/archive/refs/tags/v${PROTOBUF_VERSION}.tar.gz" -o /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz && \
    tar -xzvf /tmp/cmake-${CMAKE_VERSION}-linux-$(arch).tar.gz -C /opt/ && \
    ln -s /opt/cmake-${CMAKE_VERSION}-linux-$(arch)/bin/* /usr/bin && \
    tar -xzvf /tmp/openssl-1.1.1w.tar.gz -C /opt/ && \
    rm /tmp/openssl-1.1.1w.tar.gz && \
    chown -R root:root /opt/openssl-1.1.1w && \
    cd /opt/openssl-1.1.1w && \
    ./config --prefix=/usr && \
    make -j$(nproc) && \
    make install && \
    tar -xzvf /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz -C /opt/ && \
    rm /tmp/protobuf-${PROTOBUF_VERSION}.tar.gz && \
    chown -R root:root /opt/protobuf-${PROTOBUF_VERSION} && \
    cd /opt/protobuf-${PROTOBUF_VERSION} && \
    ./autogen.sh && \
    ./configure --prefix=/usr && \
    make -j$(nproc) && \
    make install
WORKDIR "/opt"
CMD ["/bin/bash"]