FROM osrf/ros:noetic-lscd-focal

RUN apt-get update && apt-get install -y apt-utils

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*

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

# Now create the same user as the host itself
ARG UID=1000
ARG GID=1000
RUN addgroup --gid ${GID} ros
RUN adduser --gecos "ROS User" --disabled-password --uid ${UID} --gid ${GID} ros
RUN usermod -a -G dialout ros
COPY config/99_aptget /etc/sudoers.d/99_aptget
RUN chmod 0440 /etc/sudoers.d/99_aptget && chown root:root /etc/sudoers.d/99_aptget

RUN apt-get install git
RUN apt-get install ros-noetic-turtlesim


# Choose to run as user
ENV USER ros
USER ros 

# Change HOME environment variable
ENV HOME /home/${USER} 

# workspace setup
RUN mkdir -p ${HOME}/ros_ws/src

WORKDIR ${HOME}/ros_ws/src

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd ~/ros_ws; catkin_make'

RUN /bin/bash -c '. /opt/ros/noetic/setup.bash; cd ~/ros_ws; catkin_make'

WORKDIR $ {HOME} / ros_ws / 
COPY --chown=${USER} ./source/ ./src/

RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* 

ENTRYPOINT ["/ros_entrypoint.sh"]

CMD ["bash"]

