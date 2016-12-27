# !/usr/bin/env bash

XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm -it \
    --volume=$XSOCK:$XSOCK \
    --volume=$XAUTH:$XAUTH \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY" \
    --device=/dev/dri:/dev/dri \
    --volume=/run/user/$(id -u)/pulse:/run/pulse \
    --volume=$(pwd)/of:/of \
    ybycode/openframeworks \
    bash
