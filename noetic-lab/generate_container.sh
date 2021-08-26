#!/bin/bash

mkdir -p ros_workspace

# create a shared volume to store the ros_ws
docker volume create --driver local \
    --opt type="none" \
    --opt device="${PWD}/ros_workspace/" \
    --opt o="bind" \
    "ros-noetic_workspace_vol"
 
xhost +
docker run \
    --net=host \
    --env="DISPLAY" \
    -it \
    --volume="ros-noetic_workspace_vol:/home/ros/ros_workspace/:rw" \
    --name=ros-noetic \
    --device=/dev/dri:/dev/dri \
    bruiglesias/ros-noetic-ubuntu-focal:latest