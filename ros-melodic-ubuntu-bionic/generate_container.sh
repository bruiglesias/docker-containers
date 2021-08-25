#!/bin/bash

xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --name=ros-melodic \
    --device=/dev/dri:/dev/dri \
    bruiglesias/ros-melodic-ubuntu