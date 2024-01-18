#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Kadono Kodai
# SPDX-License-Identefier: BSD-3-Clause

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class original_string(Node):
    def __init__(self):
        super().__init__('original_string')
        self.publisher = self.create_publisher(String, '/original_string', 10)

    def publish_string(self, input_string):
        msg = String()
        msg.data = input_string
        self.publisher.publish(msg)
        self.get_logger().info(f'Published: {input_string}')

def main(args=None):
    rclpy.init(args=args)
    publisher_node = StringPublisherNode()

    while rclpy.ok():
        input_string = input('Enter somethig :')
        publisher_node.publish_string(input_string)

    publisher_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
