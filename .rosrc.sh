#export ROS_LOCALHOST_ONLY=1
export ROS_DOMAIN_ID=0
source /opt/ros/humble/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash 
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/humble/


export MY_ROBOT_IP=192.168.0.90
export ROS_MASTER_URI=http://$MY_ROBOT_IP:11311
export ROS_IP=$(hostname -I)
