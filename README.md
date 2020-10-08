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
