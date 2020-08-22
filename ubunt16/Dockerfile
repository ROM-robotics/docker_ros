# This is an auto generated Dockerfile for ros:perception
# generated from docker_images/create_ros_image.Dockerfile.em
#FROM ros:kinetic-ros-base-xenial
FROM osrf/ros:kinetic-desktop-full-xenial
# install ros packages

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-kinetic-perception=1.3.2-0* \
    ros-kinetic-slam-gmapping*\
    ros-kinetic-depthimage-to-laserscan*\
    ros-kinetic-map-server*\
    ros-kinetic-navigation*\
    ros-kinetic-rplidar-ros*\
    ros-kinetic-rosserial*\
    ros-kinetic-moveit*\
    ros-kinetic-gazebo*\
    ros-kinetic-controller-interface*\
    ros-kinetic-joint-state-controller*\
    ros-kinetic-effort-controllers*\
    ros-kinetic-kobuki-gazebo-plugins*\
    ros-kinetic-yocs-cmd-vel-mux*\
    ros-kinetic-openni-launch*\
    ros-kinetic-kobuki-description*\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ros_driver/catkin_ws/src
RUN cd /ros_driver/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_init_workspace /ros_driver/catkin_ws/src'
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /ros_driver/catkin_ws; catkin_make'
RUN echo "source /ros_driver/catkin_ws/devel/setup.bash" >> /root/.bashrc

RUN mkdir -p /ros_course/catkin_ws/src
RUN cd /ros_course/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_init_workspace /ros_course/catkin_ws/src'
RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /ros_course/catkin_ws; catkin_make'
RUN echo "source /ros_course/catkin_ws/devel/setup.bash" >> /root/.bashrc



