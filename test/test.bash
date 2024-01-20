#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

(ros2 run reverse_string reverse_string )&
sleep 10

(echo -e "oken\n" | ros2 run reverse_string enter_string )&
sleep 10

jobs

fg %1

cat /tmp/reversed.log
# | grep -a 'Reversed String: neko' 
