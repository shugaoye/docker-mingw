# docker-mingw
Cross compilation environment (Linux -> Windows) using MXE
This is a build using Ubuntu:bionic.

Ubuntu:bionic -> shugaoye/mingw:bionic -> shugaoye/mingw:bionic-dev

```
docker run -ti -e USER_ID=$(id -u) -e GROUP_ID=$(id -g) -e USERNAME=$(id -un) -e GROUPNAME=$(id -gn) imagename bash
```

MXE can be found at:
```
$ ls /usr/lib/mxe
LICENSE.md  docs                           mxe.github.mk   plugins  usr
Makefile    ext                            mxe.patch.mk    src
README.md   mxe-requirements.dummy.bionic  mxe.updates.mk  tools
```

Go to KeePassXC source code folder and execute the following build command according to the instruction:
```
mkdir build
cd build
cmake -DWITH_XC_ALL=ON .. -DCMAKE_TOOLCHAIN_FILE=/usr/src/mxe/usr/x86_64-w64-mingw32.static/share/cmake/mxe-conf.cmake
make
```

or, in the latest version, please execute the following command.
```
$ i686-w64-mingw32.static-cmake -DWITH_XC_ALL=ON .. 
```

## Issue need to be fixed in container
In prebuild MXE binaries, there are broken symbol links as below.
/usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/i686-w64-mingw32.static-gcc

```
$ rm /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/i686-w64-mingw32.static-gcc
$ rm /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/gcc
$ ln -s /usr/lib/mxe/usr/bin/i686-w64-mingw32.static-gcc /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/i686-w64-mingw32.static-gcc
$ ln -s /usr/lib/mxe/usr/bin/i686-w64-mingw32.static-gcc /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/gcc

$ rm /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/i686-w64-mingw32.static-g++
$ rm /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/g++
$ ln -s /usr/lib/mxe/usr/bin/i686-w64-mingw32.static-g++ /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/i686-w64-mingw32.static-g++
$ ln -s /usr/lib/mxe/usr/bin/i686-w64-mingw32.static-g++ /usr/lib/mxe/usr/x86_64-pc-linux-gnu/bin/g++
```

Please refer to the following issues in GitHub.
- [Issue 2449](https://github.com/mxe/mxe/issues/2449) - Cannot build package gcc for target i686-w64-mingw32.static
- [Issue 2349](https://github.com/mxe/mxe/issues/2349) - Pre-Built Packages No Longer Work with CMake