#!/usr/bin/bash
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source ~/.bashrc

echo "neko" | ros2 run ReverseString original_string
timeout 10 ros2 run ReverseString reversed_string > /tmp/ReverseString.log

cat /tmp/ReverseString.log | grep 'Reversed: oken'
