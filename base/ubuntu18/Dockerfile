FROM ubuntu:18.04
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ADD sources.list /etc/apt/
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    echo 'Acquire::Retries "10";' > /etc/apt/apt.conf.d/80-retries && \
    apt-get update && \
    apt-get install -y git software-properties-common curl unzip \
        build-essential gcc g++ make automake autoconf ninja-build \
        dpkg-dev debhelper libxml2-dev uuid-dev libssl-dev \
        libgtest-dev libkrb5-dev libgsasl7-dev libboost-all-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    echo "" >> /etc/bashrc
    
WORKDIR "/opt"
CMD ["/bin/bash"]