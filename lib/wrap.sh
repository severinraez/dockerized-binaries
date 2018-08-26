#!/bin/bash

set -e

image="$1"
shift
args="$@"

IMAGE_PREFIX="dockerized-binaries"

if [[ "$image" == "" ]]; then
    echo "USAGE: wrap.sh IMAGE [ARGUMENTS]"
    exit 100
fi

function check_image() {
    (
        set +e
        image="$1"

        docker inspect "$image" >/dev/null 2>&1

        if (( $? != 0)); then
            echo "dockerized-binaries error: Image $image not built" > /dev/stderr
            exit 101
        fi
    )
}

image_name="$IMAGE_PREFIX/$image"

check_image "$image_name"

# --user: Run as yourself
# -v: Give access to home directory, /tmp
# -i: Makes sure stdin gets piped through
# -w: Pass through the current working directory
docker run \
       --user $(id -u):$(id -g) \
       -v $HOME:$HOME \
       -v /tmp:/tmp \
       -w $(pwd) \
       -i \
       "$image_name" $args
