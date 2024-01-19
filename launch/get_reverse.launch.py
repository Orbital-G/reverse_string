import launch
import launch.actions
import launch.subscriptions
import launch_ros.actions

def generate_launch_description():

    enter_string = launch_ros.actions.node(
        package='reverse_string',
        executable='enter_string',
        )
    reverse_string = launch_ros.actions.Node(
        package='reverse_string',
        executable='reverse_string',
        output='screen'
        )

    return launch.LaunchDescription([enter_string, reverse_string])