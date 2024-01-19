#!/usr/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc

(ros2 run reverse_string reverse_string > /tmp/reversed.log 2>&1) &

(echo -e "oken\n" | ros2 run reverse_string enter_string > /tmp/original.log 2>&1) &
sleep 10

if [ -e /tmp/reversed.log ]; then
    echo "reversed.log exists."
else
    echo "reversed.log not found."
fi

if grep -a 'Reversed String: neko' /tmp/reversed.log; then
    echo "OK"
    exit 0
else
    echo "Test Failed: neko not found"
    exit 1
fi