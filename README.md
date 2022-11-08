<!--- Borrowed some from <https://github.com/geerlingguy/docker-ubuntu2204-ansible/blob/master/README.md> --->
<!--- Also borrowed heavily from <https://github.com/DensityCo/docker-build> --->

# Ubuntu 22.04 LTS (Jammy Jellyfish) Image for Density Lab Chamber

Ubuntu 22.04 LTS (Jammy Jellyfish) Docker container for running the lab chamber rf test.

## Tags

- `latest`: Latest stable version of Ubuntu.

The latest tag is a lightweight image for basic development use.

## How to Build

This image is built on Docker Hub automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `master` branch. But if you need to build the image on your own locally, do the following:

  1. [Install Docker](https://docs.docker.com/install/).
  2. `cd` into this directory.
  3. Run `docker build -t density/ubuntu2204-chamber .`

## How to Use (Run)

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Run a container from the image: `docker run --detach --privileged.
  3. Run the RF test inside the container:
    a. `docker exec --tty [container_id] env TERM=xterm make ci`
    b. `docker exec --tty [container_id] env TERM=xterm make rftest`
