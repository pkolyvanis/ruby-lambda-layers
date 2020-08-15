#!/bin/bash -x

# clean up - previous build
rm -rf layer && mkdir -p layer/ruby/gems

# build the docker image
docker build -t ruby-layer-builder .

# run in detached mode and store the container id
CONTAINER_ID=$(docker run -d ruby-layer-builder false)

# copy the installed gem dependencies from the container to the local filesystem
docker cp \
    $CONTAINER_ID:/var/task/vendor/bundle/ruby/2.7.0 \
    layer/ruby/gems/2.7.0

# delete cache folder to reduce layer size
rm -rf layer/ruby/gems/2.7.0/cache

# clean up - docker image and container
docker rm $CONTAINER_ID
docker rmi ruby-layer-builder
