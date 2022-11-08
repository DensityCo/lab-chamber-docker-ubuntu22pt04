FROM ubuntu:22.04
LABEL maintainer = "Density Labs Team"

ENV \
# Extra include PATH, it may not include /usr/local/(s)bin on some systems
    PATH=$PATH:/usr/local/bin/

# Install dependencies.
RUN sed -i 's/main$/main universe/' /etc/apt/sources.list \
  && export DEBIAN_FRONTEND=noninteractive \
  && dpkg --add-architecture i386 \
  && apt-get update \
  && apt-get upgrade -y \
  && cp /etc/apt/sources.list /etc/apt/sources.list~ \
  && sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    bash-completion \
    git \
    python3 \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    libffi-dev \
    rustc \
    cargo \
    rsync \
    screen \
    sudo \
    net-tools \
    tig \
    wget \
    make \
    gcc \
  && rm -rf /var/lib/apt/lists/*  \
  && apt-get clean

# Install python requirements
RUN python3 -m pip install --upgrade pip \
  && pip3 install awscli --upgrade --user

ARG hostuid=1000
ARG hostgid=1000

RUN \
    groupadd --gid $hostgid --force chamber && \
    useradd --gid $hostgid --uid $hostuid --non-unique chamber && \
    rsync -a /etc/skel/ /home/chamber/

# Add sudo permission
RUN echo "chamber ALL=NOPASSWD: ALL" > /etc/sudoers.d/chamber

ADD startup.sh /home/chamber/startup.sh
RUN chmod a+x /home/chamber/startup.sh

# Fix ownership
RUN chown -R chamber:chamber /home/chamber

VOLUME /home/chamber/ubuntu2204
VOLUME /home/chamber/.ssh

USER chamber
WORKDIR /home/chamber/dev

CMD /home/chamber/startup.sh