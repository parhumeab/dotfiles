#!/bin/bash

## Compiling Python 3.6.9
cd /usr/src
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
tar -xvzf Python-3.6.9.tgz
cd Python-3.6.9

#https://stackoverflow.com/a/35866413/152016
./configure --enable-optimizations --enable-shared
make install
rm /usr/src/Python-3.6.9.tgz

#Finding python3 lib
#https://stackoverflow.com/a/7880519/152016
#echo '/usr/local/lib' >> /etc/ld.so.conf && ldconfig
