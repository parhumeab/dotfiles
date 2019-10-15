#!/bin/bash
####### Vim compilation on CentOS 7 ####################
# (Tested together with official CentOS 7 docker image)
########################################################

BUILD_ESSENTIALS='gcc gcc-c++ make zlib zlib-devel'
NCURSES='ncurses ncurses-devel ncurses-term'
X11='libXpm-devel libXt-devel'
BUILD_PACKAGES="$BUILD_ESSENTIALS $X11 $NCURSES"

RUBY='ruby ruby-devel'
TCL='tcl tcl-devel'
LUA='lua lua-devel'

# https://github.com/vim/vim/issues/3557#issuecomment-447099556
# https://github.com/Linuxbrew/legacy-linuxbrew/issues/1046#issuecomment-288133243
PERL='perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-Embed'

# https://bugs.python.org/issue31652#msg321260
# https://tecadmin.net/install-python-3-7-on-centos/
PYTHON_DEPS='python-devel openssl-devel bzip2-devel libffi-devel'

LANGUAGES="$RUBY $TCL $LUA $PERL $PYTHON_DEPS"
MISC_PACKAGES='git tmux bash-completion sudo curl wget'
TERM=xterm-256color

yum -y install $BUILD_PACKAGES $LANGUAGES $MISC_PACKAGES

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
echo '/usr/local/lib' >> /etc/ld.so.conf && ldconfig

cd /tmp                                   &&                   \
    git clone https://github.com/vim/vim  &&                   \
    cd /tmp/vim                           &&                   \
    ./configure --with-features=huge                           \
    --enable-luainterp                                         \
    --enable-multibyte                                         \
    --enable-pythoninterp                                      \
    --with-python-config-dir=/usr/lib64/python2.7/config/      \
    --enable-python3interp                                     \
    --with-python3-config-dir=/usr/local/lib/python3.6/config-3.6m-x86_64-linux-gnu \
    --enable-perlinterp                                        \
    --enable-rubyinterp                                        \
    --enable-tclinterp                                         \
    --disable-gui                                              \
    --prefix /usr                         &&                   \
    make                                  &&                   \
    make install
