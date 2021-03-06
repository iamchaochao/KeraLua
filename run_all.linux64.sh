#!/bin/sh
# If you have mono x86 installed on a amd64 linux.
export CFLAGS=-m64
export CXXFLAGS=-m64
export LDFLAGS=-m64
make -f Makefile.Linux
export LD_LIBRARY_PATH=$PWD/external/lua/linux/lib64:$PWD/external/lua/linux/lib
#export LD_LIBRARY_PATH=$PWD/external/lua/linux/lib
xbuild KeraLua.Net45.sln /p:Configuration=Release
cd tests/
nunit-console KeraLua.Tests.dll
