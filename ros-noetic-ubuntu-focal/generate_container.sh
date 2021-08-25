#!/bin/bash

xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --name=ros-noetic \
    --device=/dev/dri:/dev/dri \
    bruiglesias/ros-noetic-ubuntu