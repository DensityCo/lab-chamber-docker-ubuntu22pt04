#!/bin/sh

# in Docker, the USER variable is unset by default
export USER="$(whoami)"

# Launch screen session
screen -s /bin/bash