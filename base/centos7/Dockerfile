FROM centos:7
LABEL maintainer="Vincent<vincent.zc.zhang@gmail.com>"
ARG TZ=Asia/Shanghai
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    yum -y update && \
    yum -y install epel-release centos-release-scl && \
    yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum -y install devtoolset-7 which git curl unzip gcc gcc-c++ make automake autoconf \
        ninja-build libtool libxml2-devel libuuid-devel gtest-devel krb5-devel libgsasl-devel && \
    echo "source scl_source enable devtoolset-7" >> /etc/bashrc && \
    echo "export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib" >> /etc/bashrc && \
    yum clean all

WORKDIR "/opt"
CMD ["/bin/bash"]