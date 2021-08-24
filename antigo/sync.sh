#!/bin/bash
NAME=ros_ws # replace by the name of your image
TAG=noetic # the tag of your built image
mkdir -p source
# create a shared volume to store the ros_ws
docker volume create --driver local \
    --opt type="none" \
    --opt device="${PWD}/source/" \
    --opt o="bind" \
    "${NAME}_src_vol"

xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --volume="${NAME}_src_vol:/home/ros/ros_ws/src/:rw" \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --device=/dev/dri:/dev/dri \
    "${NAME}:${TAG}"