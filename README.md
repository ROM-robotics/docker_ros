<h2>Version 2</h2>
<p> First you need to build image . Then run "sudo docker-compose up ." .
	After running , 3 containers will run and communicate with ros </p>
	
docker run -it --network=host --device /dev/ttyACM0 --device /dev/ttyUSB0 ghostmanvsrobot/clean_chefbot:kinetic bash

	echo "192.168.100.30 ubuntu">>/etc/hosts
	source /ros_entry_point.sh
	echo "export ROS_IP=192.168.100.30">>~/.bashrc
	echo "export ROS_HOSTNAME=192.168.100.30">>~/.bashrc
	echo "export ROS_MASTER_URI=http://localhost:11311">>~/.bashrc
	source ~/.bashrc
