#!/bin/bash

mkdir -p ros_workspace

# create a shared volume to store the ros_ws
docker volume create --driver local \
    --opt type="none" \
    --opt device="${PWD}/ros_workspace/" \
    --opt o="bind" \
    "ros-melodic_src_vol"
 
xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --volume="ros-melodic_src_vol:/home/ros/ros_workspace/:rw" \
    --name=ros-melodic \
    --device=/dev/dri:/dev/dri \
    bruiglesias/ros-melodic-ubuntu-bionic:latest
