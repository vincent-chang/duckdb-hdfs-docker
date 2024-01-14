FROM opstool/kylin:v10sp1
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG TZ=Asia/Shanghai
# ADD CentOS-Base.repo /etc/yum.repos.d/
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    yum -y update && \
    yum -y install which git curl unzip gcc gcc-c++ make automake autoconf \
        ninja-build libtool libxml2-devel libuuid-devel gtest-devel krb5-devel && \
    echo "export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib" >> /etc/bashrc && \
    yum clean all

RUN curl -fSL "https://ftp.gnu.org/gnu/gsasl/libgsasl-1.8.0.tar.gz" -o /tmp/libgsasl-1.8.0.tar.gz && \
    tar -xzvf /tmp/libgsasl-1.8.0.tar.gz -C /opt/ && \
    rm -f /tmp/libgsasl-1.8.0.tar.gz && \
    chown -R root:root /opt/libgsasl-1.8.0 && \
    cd /opt/libgsasl-1.8.0 && \
    ./configure --prefix=/usr && \
    make -j$(nproc) && \
    make install

WORKDIR "/opt"
CMD ["/bin/bash"]