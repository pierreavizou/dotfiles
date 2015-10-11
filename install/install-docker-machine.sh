#!/bin/sh -eu
#
# Install Docker Machine (https://github.com/docker/machine)

DOCKER_MACHINE_VERSION=0.4.1
DOCKER_MACHINE_URL=https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine_linux-amd64

is_up2date() {
    docker-machine -version 2> /dev/null \
        | grep -c "^docker-machine version $(echo $DOCKER_MACHINE_VERSION | sed 's/-.*//')" > /dev/null
}

if ! is_up2date
then
    echo "Install docker-machine v$DOCKER_MACHINE_VERSION..."
    sudo wget ${DOCKER_MACHINE_URL} -O /usr/bin/local/docker-machine \
        && sudo chmod 755 /usr/bin/local/docker-machine
else
    echo "docker-machine v$DOCKER_MACHINE_VERSION is up-to-date"
fi
