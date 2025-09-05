#!/bin/bash
set -e

# Source ROS 2 Humble
source /opt/ros/humble/setup.bash

# Source rom_sdk_ws if built
if [ -f "$HOME/rom_sdk_ws/install/setup.bash" ]; then
  source $HOME/rom_sdk_ws/install/setup.bash
fi

# Execute the container's main command
exec "$@"
