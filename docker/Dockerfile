# =============================================================================
# Unitree Go1 Simulation Dockerfile
# Created by: Shaun Altmann
# 
# Used to create a docker image capable of independently running a simulation
# of the Unitree Go1 robot with LiDAR, Camera Point Clouds, SLAM, and the ROS
# Navigation Stack.
# =============================================================================

# =============================================================================
# Ubuntu 20.04 Base
# =============================================================================
FROM ubuntu:focal-20241011


# =============================================================================
# Prevent User Interaction
# =============================================================================
ENV DEBIAN_FRONTEND=noninteractive


# =============================================================================
# Force Software Rendering
# =============================================================================
ENV LIBGL_ALWAYS_SOFTWARE=1


# =============================================================================
# Update Debian Packages
# =============================================================================
RUN apt-get update
RUN apt-get upgrade -y


# =============================================================================
# Install Debian Packages
# =============================================================================
RUN apt-get install -y \
    tzdata \
    dirmngr \
    gnupg2 \
    curl \
    wget \
    lsb-release \
    git \
    build-essential \
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    ffmpeg \
    libavcodec-extra \
    ubuntu-restricted-extras


# =============================================================================
# Setup ROS + Webots Keys
# =============================================================================

# ===============
# ROS Noetic Keys
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN bash -c 'curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -'

# =============
# ROS Foxy Keys
RUN bash -c 'curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg'
RUN bash -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null'

# ===========
# Webots Keys
WORKDIR /etc/apt/keyrings/
RUN wget -q https://cyberbotics.com/Cyberbotics.asc
RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/Cyberbotics.asc] https://cyberbotics.com/debian binary-amd64/" | tee /etc/apt/sources.list.d/Cyberbotics.list


# =============================================================================
# Update + Upgrade Debian Packages
# =============================================================================
RUN apt-get update
RUN apt-get upgrade -y


# =============================================================================
# Install Debian Packages
# =============================================================================
RUN apt-get install -y \
    ros-noetic-ros-base \
    ros-noetic-sensor-msgs \
    ros-noetic-tf2-tools \
    ros-foxy-ros-base \
    ros-foxy-sensor-msgs \
    ros-foxy-tf2-tools \
    python3-pip \
    python3-rosdep \
    python3-colcon-common-extensions \
    python3-catkin-tools \
    webots \
    ros-foxy-webots-ros2
ENV WEBOTS_HOME=/home/rosuser/webots

# ros-noetic-desktop-full \
# ros-noetic-gazebo-plugins \


# =============================================================================
# Install Python Packages
# =============================================================================
RUN python3 -m pip install --upgrade pip --no-input
RUN python3 -m pip install --no-input \
    lxml \
    pyproj \
    shapely \
    webcolors \
    configparser


# =============================================================================
# Add User (rosuser)
# =============================================================================
# Run `useradd --help` for more information on adding a user
RUN useradd \
    -rm \
    -d /home/ubuntu \
    -s /bin/bash \
    -g root \
    -G sudo \
    -u 1000 rosuser \
    -p $(openssl passwd -6 rosuser)
WORKDIR /home/rosuser


# =============================================================================
# Updating ROS Dependencies
# =============================================================================
RUN rosdep update --rosdistro noetic
RUN rosdep update --rosdistro foxy


# =============================================================================
# Build Webots World
# =============================================================================
COPY maps/ /home/rosuser/maps/
RUN python3 /home/rosuser/webots/resources/importer.py \
    --input=map-waurnponds.osm \
    --output=map-waurnponds.wbt


# =============================================================================
# Set Default User
# =============================================================================
USER rosuser
WORKDIR /home/rosuser/


# =============================================================================
# End of File
# =============================================================================
