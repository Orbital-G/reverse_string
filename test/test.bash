#!/usr/bin/bash
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

(echo "neko\n" | ros2 run ReverseString enter_string )
timeout 1 ros2 run ReverseString reverse_string > /tmp/ReverseString.log

(cat /tmp/ReverseString.log | grep 'Reversed: oken')
