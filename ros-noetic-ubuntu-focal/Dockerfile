FROM osrf/ros:noetic-desktop-full

RUN apt-get update && apt-get install -y apt-utils

RUN \
  apt-get update && \
  apt-get -y install libgl1-mesa-glx libgl1-mesa-dri && \
  rm -rf /var/lib/apt/lists/*


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
 wget \
 git \
 bash-completion \
 build-essential \
 sudo \
 && rm -rf /var/lib/apt/lists/*

 RUN apt-get update && apt-get install -y \
 xcb \
 sudo \
 && rm -rf /var/lib/apt/lists/*

ARG UID=1000
ARG GID=1000
RUN addgroup --gid ${GID} ros
RUN adduser --gecos "ROS User" --disabled-password --uid ${UID} --gid ${GID} ros
RUN usermod -a -G dialout ros
COPY config/99_aptget /etc/sudoers.d/99_aptget
RUN chmod 0440 /etc/sudoers.d/99_aptget && chown root:root /etc/sudoers.d/99_aptget

ENV USER ros
USER ros 

# Change HOME environment variable
ENV HOME /home/${USER}