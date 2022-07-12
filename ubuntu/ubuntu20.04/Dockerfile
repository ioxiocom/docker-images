FROM ubuntu:20.04

RUN : \
 && set -exu \
 && apt update\
 && apt-get -y install wget make libfindbin-libs-perl gcc\
 && wget https://www.openssl.org/source/openssl-1.1.1q.tar.gz \
 && tar xzvf openssl-1.1.1q.tar.gz \
 && cd openssl-1.1.1q \
 && ./config --prefix=/usr/local/ssl  --openssldir=/usr/local/ssl  \
 && make \
 && make test \
 && make install \
 && echo "/usr/local/ssl/lib" >> /etc/ld.so.conf.d/openssl-1.1.1c.conf \
 && ldconfig -v \
 && mv /usr/bin/c_rehash /usr/bin/c_rehash.backup \
 && mv /usr/bin/openssl /usr/bin/openssl.backup \
 && :
ENV PATH="/usr/local/ssl/bin:${PATH}"
