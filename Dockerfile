FROM ubuntu:bionic
MAINTAINER Roger Ye <shugaoye@yahoo.com>

COPY utils/sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y gnupg net-tools sudo build-essential cmake g++

#Use http://mirror.mxe.cc/
#First add the repository and install the static gcc compiler. This ensures that everything basic is setup.
# Linux build packages, we need to install the same for MXE
# sudo apt install qtbase5-dev qtbase5-private-dev qttools5-dev \
#    qttools5-dev-tools libqt5svg5-dev libgcrypt20-dev libargon2-dev \
#    libqrencode-dev libsodium-dev zlib1g-dev asciidoctor
RUN echo "deb http://pkg.mxe.cc/repos/apt bionic main" > \
   /etc/apt/sources.list.d/mxeapt.list && \
   apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9 && \
   apt-get update && \
   apt-get install -y mxe-i686-w64-mingw32.static-gcc \
   nsis \
   zip \
   libtool
#All packages!
#RUN apt-get update && wget -O - http://mirror.mxe.cc/repos/apt/debian/dists/bionic/main/binary-amd64/Packages | grep Package | awk '{print $2}' | xargs apt-get install -y

#Set the path
env PATH /usr/lib/mxe/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
# VOLUME ["/tmp/ccache", "/mono"]

# Work in the build directory, repo is expected to be init'd here
# WORKDIR /mono

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
COPY utils/bashrc /root/bashrc
ENTRYPOINT ["/root/docker_entrypoint.sh"]
