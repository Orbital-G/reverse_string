#!/usr/bin/bash
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause


dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

(echo -e "neko\n" | ros2 run ReverseString enter_string > /tmp/original.log 2>&1) &
sleep 10

(ros2 run ReverseString reverse_string > /tmp/reversed.log 2>&1) &
sleep 10

(res=0; cat /tmp/reversed.log | grep -a 'neko' || { echo "NG: neko not found"; res=1; })

[ "$res" = 0 ] && echo "OK" || echo "Test Failed"
exit $res