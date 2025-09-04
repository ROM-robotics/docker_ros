# Use the official Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables for the user and working directory
ENV USER_NAME=mr_robot
ENV HOME_DIR=/home/$USER_NAME

# Set up locales
RUN apt-get update && apt-get install -y locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG=en_US.UTF-8

# Install dependencies for adding repositories
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    lsb-release

# Add ROS 2 GPG key
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Add ROS 2 repository to sources list
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Update and install ROS 2 Humble desktop full, ros2_control, and Gazebo Fortress packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    ros-humble-desktop-full \
    ros-humble-gazebo-ros2-control \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    ros-humble-effort-controllers \
    ros-humble-velocity-controllers \
    ros-humble-gripper-controllers \
    ros-humble-position-controllers \
    ros-humble-tricycle-controller \
    ros-humble-admittance-controller \
    ros-humble-forward-command-controller \
    ros-humble-joint-trajectory-controller \
    ros-humble-rqt-joint-trajectory-controller \
    ros-humble-controller-manager \
    ros-humble-rqt-controller-manager \
    ros-humble-hardware-interface \
    ros-humble-controller-interface \
    ros-humble-transmission-interface \
    ros-humble-control-msgs \
    ros-humble-controller-manager-msgs \
    ros-humble-realtime-tools \
    ros-humble-ros2-control-test-assets \
    ros-humble-joint-limits \
    ros-humble-joint-state-broadcaster \
    ros-humble-force-torque-sensor-broadcaster \
    ros-humble-force-torque-sensor-broadcaster \
    ros-humble-ackermann-* \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-rosbridge-server \
    ros-humble-robot-localization \
    ros-humble-twist-mux \
    ros-humble-imu-sensor-broadcaster \
    python3-colcon-common-extensions \
    sudo tmux tmuxinator qtbase5-dev libqt5svg5-dev libzmq3-dev libdw-dev \
    build-essential git wget vim nano neovim neovim-qt \
    ros-humble-gz-ros2-control ros-humble-rmw-cyclonedds-cpp

# Create the new user and set up their home directory
RUN useradd -ms /bin/bash mr_robot && \
    echo "mr_robot:mr_robot" | chpasswd && \
    usermod -aG sudo mr_robot

# Set the working directory to the new user's home
WORKDIR $HOME_DIR

# Copy the entrypoint script and set permissions
COPY --chown=$USER_NAME:$USER_NAME entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Add custom environment variables and aliases to mr_robot's .bashrc
RUN echo '# ROS Robot Model' >> /home/$USER_NAME/.bashrc && \
    echo 'export ROM_ROBOT_MODEL=bobo' >> /home/$USER_NAME/.bashrc && \
    echo '' >> /home/$USER_NAME/.bashrc && \
    echo "# Aliases" >> /home/$USER_NAME/.bashrc && \
    echo "alias bb='colcon build && source install/setup.bash'" >> /home/$USER_NAME/.bashrc && \
    echo "alias delete_workspace='rm -rf build install log; echo \"Done\"'" >> /home/$USER_NAME/.bashrc && \
    echo "alias bb_save='colcon build --executor sequential --parallel-workers 4'" >> /home/$USER_NAME/.bashrc && \
    echo "alias bb_rm='colcon build && source install/setup.bash && rm -rf src/*'" >> /home/$USER_NAME/.bashrc && \
    echo "alias bb_save_rm='colcon build --executor sequential --parallel-workers 4 && rm -rf src/*'" >> /home/$USER_NAME/.bashrc && \
    echo "alias commit_push='git add *; git commit -m \"update\"; git push origin humble-devel'" >> /home/$USER_NAME/.bashrc && \
    echo '' >> /home/$USER_NAME/.bashrc && \
    echo '# RMW Implementation' >> /home/$USER_NAME/.bashrc && \
    echo 'export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp' >> /home/$USER_NAME/.bashrc && \
    echo '' >> /home/$USER_NAME/.bashrc && \
    echo '# QT Platform (default commented)' >> /home/$USER_NAME/.bashrc && \
    echo '#export QT_QPA_PLATFORM=xcb' >> /home/$USER_NAME/.bashrc && \
    echo '#export QT_QPA_PLATFORM=wayland' >> /home/$USER_NAME/.bashrc && \
    echo '' >> /home/$USER_NAME/.bashrc && \
    echo '' >> /home/$USER_NAME/.bashrc && \
    echo '# Turtlebot model' >> /home/$USER_NAME/.bashrc && \
    echo 'export TURTLEBOT3_MODEL=burger' >> /home/$USER_NAME/.bashrc

# Create and build the ROM SDK workspace
RUN mkdir -p $HOME_DIR/rom_sdk_ws/src && \
    cd $HOME_DIR/rom_sdk_ws && \
    /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

# Ensure user owns the workspace
RUN chown -R $USER_NAME:$USER_NAME $HOME_DIR/rom_sdk_ws

# Switch to the new user
USER $USER_NAME

# Define the entrypoint to source the ROS 2 environment and then execute the CMD
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Command to keep the container running and interactive
CMD ["/bin/bash"]
