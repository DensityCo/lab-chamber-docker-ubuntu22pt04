#!/usr/bin/env bash

SOURCE=$(pwd)/dev
CONTAINER_HOME=/home/chamber
CONTAINER=density-chamber-ubuntu2204
REPOSITORY=density/chamber-ubuntu2204
TAG=0.01
FORCE_BUILD=0
PRIVILEGED=
ENVIRONMENT=
	docker run $PRIVILEGED  -v $SOURCE:$CONTAINER_HOME/dev:delegated  -v  ~/.ssh:/home/chamber/.ssh:ro -v ~/.gitconfig:/home/chamber/.gitconfig:ro  -it  $REPOSITORY
