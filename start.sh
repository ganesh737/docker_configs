#!/usr/bin/env bash

set -e

usage() {
    echo "Usage:"
    echo "$0 <options>"
    echo "Available options:"
    echo "-y|-j|-n Use yocto/jekyll/nodejs container(y is the default value)"
    echo "-x    Use X11 forwarding"
    echo "-f    Forward /dev/net/tun"
    echo "-p    Run container in privileged mode"

    exit 0
}

# rough check to see if we are in correct directory
# dirs_to_check=( "./cache/downloads" "./cache/sstate" "./home" )
# for d in "${dirs_to_check[@]}"; do
#   if [[ ! -d ${d} ]]; then
#     echo "\"${d}\" directory not found"
#     usage
#   fi
# done

arg_privileged=""
set_arg_privileged() {
    echo "WARNING: Running the container with privileged access"
    arg_privileged="--privileged"
}

arg_x11_forward=""
set_arg_x11() {
    xhost +
    arg_x11_forward="--env DISPLAY=unix${DISPLAY} \
--volume ${XAUTH}:/root/.Xauthority \
--volume /tmp/.X11-unix:/tmp/.X11-unix "
}

arg_net_forward=""
tun_dev="/dev/net/tun"
set_arg_net() {
    arg_net_forward="--cap-add=NET_ADMIN \
--device ${tun_dev}:/dev/net/tun
--publish 8000:8000"
}

set_nodejs_env_vars() {
    echo "set_nodejs_env_vars"
    docker_img_name="nodejs"
    docker_img_version="1.0"
}

set_yocto_build_env_vars() {
    echo "set_yocto_build_env_vars"
    docker_img_name="yocto"
    docker_img_version="1.0"
}

set_yocto_build_env_vars
# parse input arguments
while getopts ":hxfpyn" opt; do
    case ${opt} in
        h )
            usage
            ;;
        x )
            command -v xhost >/dev/null 2>&1 || { echo >&2 "\"xhost\" is not installed"; exit 1; }
            set_arg_x11
            ;;
        f )
            [[ -e "${tun_dev}" ]] || { echo >&2 "\"${tun_dev}\" not found, is the \"tun\" kernel module loaded?"; exit 1; }
            set_arg_net
            ;;
        p )
            set_arg_privileged
            ;;
        y )
            set_yocto_build_env_vars
            ;;
        n )
            set_nodejs_env_vars
            ;;
        \? )
            echo "Invalid Argument: \"${opt}\"" 1>&2
            usage
            ;;
    esac
done

empty_password_hash="U6aMy0wojraho"

docker container run \
    -it \
    --rm \
    -v "${PWD}":/home/ganesh/ws \
    --name $docker_img_name \
    ${arg_net_forward} \
    ${arg_x11_forward} \
    ${arg_privileged} \
    --volume "${PWD}/home":/home/ganesh \
    $docker_img_name:$docker_img_version \
    sudo bash -c "groupadd -g 1000 ganesh && useradd --password ${empty_password_hash} --shell /bin/bash -u ${UID} -g 1000 \
    ganesh && usermod -aG sudo ganesh && usermod -aG users ganesh && cd /home/ganesh/ws && su ganesh"
