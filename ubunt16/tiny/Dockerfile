FROM ros:kinetic-ros-core-xenial

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-ros-base=1.3.2-0* \
    ros-kinetic-perception=1.3.2-0* \
    ros-kinetic-slam-gmapping*\
    ros-kinetic-depthimage-to-laserscan*\
    ros-kinetic-map-server*\
    ros-kinetic-navigation*\
    ros-kinetic-rplidar-ros*\
    ros-kinetic-rosserial*\
    ros-kinetic-moveit*\
    && rm -rf /var/lib/apt/lists/*



RUN mkdir -p /ros_driver/catkin_ws/src
RUN cd /ros_driver/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_init_workspace /ros_driver/catkin_ws/src'
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /ros_driver/catkin_ws; catkin_make'
RUN echo "source /ros_driver/catkin_ws/devel/setup.bash" >> /root/.bashrc

RUN mkdir -p /ros_robot/catkin_ws/src
RUN cd /ros_robot/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_init_workspace /ros_robot/catkin_ws/src'
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /ros_robot/catkin_ws; catkin_make'
RUN echo "source /ros_robot/catkin_ws/devel/setup.bash" >> /root/.bashrc
