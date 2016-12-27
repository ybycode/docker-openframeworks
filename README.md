
## What ?

Openframeworks (http://openframeworks.cc) in a docker environment for developement, with X11,
hardware acceleration, pulseaudio enabled.

The openframeworks code is mounted as a volume in the container and thus stays accessible
for developping from the host machine.


## Why ?

Easy way to make openframeworks work in a non lsb linux distribution.


## How to use ?


    $ docker clone https://github.com/ybycode/docker-openframeworks.git
    $ cd docker-openframeworks
    $ ./build.sh


The `build.sh` script will:

- download the openframeworks archive,
- build the docker container,
- compile the openframeworks libraries from within the container.

When the build is ok:

    $ ./run.sh

This script will:

- enable X11 from the container (managing XAUTHORITY etc.),
- enable hardware acceleration and pulseaudio from the host,
- finally gives a bash prompt in the container to run compilation
  of apps and run them.

