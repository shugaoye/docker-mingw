# docker-mingw
Cross compilation environment

```
docker run -ti -e USER_ID=$(id -u) -e GROUP_ID=$(id -g) -e USERNAME=$(id -un) -e GROUPNAME=$(id -gn) imagename bash
```

MXE can be found at:
```
$ ls /usr/src/mxe/usr/bin
cmake-configure-file                 x86_64-w64-mingw32.static-g++         x86_64-w64-mingw32.static-nm
config.guess                         x86_64-w64-mingw32.static-gcc         x86_64-w64-mingw32.static-objcopy
x86_64-w64-mingw32.static-addr2line  x86_64-w64-mingw32.static-gcc-5.5.0   x86_64-w64-mingw32.static-objdump
x86_64-w64-mingw32.static-ar         x86_64-w64-mingw32.static-gcc-ar      x86_64-w64-mingw32.static-pkg-config
x86_64-w64-mingw32.static-as         x86_64-w64-mingw32.static-gcc-nm      x86_64-w64-mingw32.static-ranlib
x86_64-w64-mingw32.static-c++        x86_64-w64-mingw32.static-gcc-ranlib  x86_64-w64-mingw32.static-readelf
x86_64-w64-mingw32.static-c++filt    x86_64-w64-mingw32.static-gcov        x86_64-w64-mingw32.static-size
x86_64-w64-mingw32.static-cmake      x86_64-w64-mingw32.static-gcov-dump   x86_64-w64-mingw32.static-strings
x86_64-w64-mingw32.static-cpack      x86_64-w64-mingw32.static-gcov-tool   x86_64-w64-mingw32.static-strip
x86_64-w64-mingw32.static-cpp        x86_64-w64-mingw32.static-gfortran    x86_64-w64-mingw32.static-windmc
x86_64-w64-mingw32.static-dlltool    x86_64-w64-mingw32.static-gprof       x86_64-w64-mingw32.static-windres
x86_64-w64-mingw32.static-dllwrap    x86_64-w64-mingw32.static-ld
x86_64-w64-mingw32.static-elfedit    x86_64-w64-mingw32.static-ld.bfd
```
Go to KeePassXC source code folder and execute the following build command according to the instruction:
```
mkdir build
cd build
cmake -DWITH_XC_ALL=ON .. -DCMAKE_TOOLCHAIN_FILE=/usr/src/mxe/usr/x86_64-w64-mingw32.static/share/cmake/mxe-conf.cmake
make
```
