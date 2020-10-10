FROM shugaoye/mingw:bionic

LABEL maintainer="shugaoye@yahoo.com"

RUN apt-get install -y python3 \
mxe-i686-w64-mingw32.static-qtbase \
mxe-i686-w64-mingw32.static-qttools \
mxe-i686-w64-mingw32.static-qtsvg \
mxe-i686-w64-mingw32.static-libgcrypt \
mxe-i686-w64-mingw32.static-libqrencode \
mxe-i686-w64-mingw32.static-libsodium \
mxe-i686-w64-mingw32.static-zlib \
mxe-i686-w64-mingw32.static-libgpg-error

#All packages!
#RUN apt-get update && wget -O - http://mirror.mxe.cc/repos/apt/debian/dists/bionic/main/binary-amd64/Packages | grep Package | awk '{print $2}' | xargs apt-get install -y

# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
# VOLUME ["/tmp/ccache", "/mono"]

# Work in the build directory, repo is expected to be init'd here
# WORKDIR /mono

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
COPY utils/bashrc /root/bashrc
COPY utils/windeployqt /usr/local/bin/windeployqt
ENTRYPOINT ["/root/docker_entrypoint.sh"]
