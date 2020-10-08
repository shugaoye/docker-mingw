#!/bin/sh

USER_ID=`id -u`
USERNAME=`id -un`
GROUP_ID=`id -g`
GROUPNAME=`id -gn`

# Using mingw:latest if there is no command line argument
#IMAGE=dockcross/windows-x64:latest
if [ -n "$1" ]; then
        IMAGE=$1
else
        IMAGE=shugaoye/mingw:bionic
fi

docker run -ti --rm -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/github:/home/$USERNAME/github \
  -v $HOME/.Xauthority:$HOME/.Xauthority \
  --net=host \
  -e USER_ID=${USER_ID} -e GROUP_ID=${GROUP_ID} \
  -e USERNAME=${USERNAME} -e GROUPNAME=${GROUPNAME} \
  ${IMAGE} /bin/bash
