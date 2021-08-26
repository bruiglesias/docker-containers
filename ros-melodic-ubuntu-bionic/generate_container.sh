#!/bin/bash

mkdir -p src

# create a shared volume to store the ros_ws
docker volume create --driver local \
    --opt type="none" \
    --opt device="${PWD}/src/" \
    --opt o="bind" \
    "ros-melodic _src_vol"
 
xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --volume="ros-melodic_src_vol:/home/ros/ros_workspace/src/:rw" \
    --name=ros-melodic \
    --device=/dev/dri:/dev/dri \
    bruiglesias/ros-melodic-ubuntu-bionic:latest