#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class reversed_string(Node):
    def __init__(self):
        super().__init__('reversed_string')
        self.subscription = self.create_subscription(String, '/original_string', self.string_callback, 10)

    def string_callback(self, msg):
        original_string = msg.data
        reversed_string = self.reversed_string(original_string)
        self.get_logger().info(f"Reversed String: {reversed_string}")
        print(f"reverce: {reversed_string}")

    def reversed_string(self, input_string):
        return input_string[::-1]

def main(args=None):
    rclpy.init(args=args)
    reversed_node = reversed_string()
    rclpy.spin(reversed_node)
    reversed_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
