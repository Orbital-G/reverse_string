from setuptools import setup

package_name = 'reverseString'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name), glob('launch/*.launch.py'))
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='jojo',
    maintainer_email='s22c1033ru@s.chibakoudai.jp',
    description='return the entered string in reverse',
    license='BSD-3-Clause',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
        'enter_string = reverse_string.enter_string:main',
        'reverse_string = reverse_string.reverse_string:main',
        ],
    },
)
