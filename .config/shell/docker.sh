#!/bin/sh

alias dc="docker-compose"

dspa(){
    # docker system prune --all
    yes | docker system prune --all --volumes
}

dsp(){
    # docker system prune
    yes | docker system prune --volumes
}

drmid(){
    # docker rmi dangling
    docker rmi -f $(docker images -f "dangling=true" -q)
}

drun(){
    # docker run
    docker run --rm -it $1 ${2:-bash}
}

dex(){
    # docker run
    docker exec -it $1 ${2:-bash}
}

dim(){
    # docker images
    docker images
}

dpsa(){
    # docker ps --all
    docker ps --all
}

dps(){
    # docker ps
    docker ps
}
