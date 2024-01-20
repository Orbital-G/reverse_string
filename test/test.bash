#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

(ros2 run reverse_string reverse_string > /tmp/reversed.log 2>&1)&
sleep 10

ros2 topic list | grep original_string
(echo -e "oken\n" | ros2 run reverse_string enter_string > /tmp/original.log 2>&1)&
sleep 10

sleep 5
jobs

if ! cat /tmp/reversed.log | grep -a 'Reversed String: neko'; then
  echo "NG: neko not found"
  exit 1
else
  echo "OK"
  exit 0
fi
