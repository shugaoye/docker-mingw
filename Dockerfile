#
# Based on dockcross/windows-x64
#
FROM dockcross/windows-x64

MAINTAINER Roger Ye <shugaoye@yahoo.com>

COPY utils/sources.list /etc/apt/sources.list
# Install vi
RUN apt-get update
RUN apt-get install -y net-tools sudo

# WORKDIR /tmp


# The persistent data will be in these two directories, everything else is
# considered to be ephemeral
# VOLUME ["/tmp/ccache", "/mono"]

# Work in the build directory, repo is expected to be init'd here
# WORKDIR /mono

COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
ENTRYPOINT ["/root/docker_entrypoint.sh"]
