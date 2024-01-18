#!/usr/bin/bash
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colcon build
source $dir/.bashrc
expect <<EOF
set timeout 5

spawn ros2 run ReverseString enter_string
expect "Enter:"
send "neko\n"
expect "Reversed: oken"
exit 0
EOF

(cat /tmp/ReverseString.log | grep 'Reversed: oken')
