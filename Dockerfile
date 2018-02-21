FROM ubuntu:18.04

ARG USER_ID
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

# Upgrade system to the latest package versions
RUN apt-get update
RUN apt-get --assume-yes upgrade

# Install additional packages
RUN apt-get --assume-yes install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping locales bison flex

# Configure locales
RUN rm -rf /var/lib/apt/lists/*
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Create user, ignore error if user already exists
RUN groupadd --gid ${GROUP_ID} ${GROUP_NAME}; exit 0
RUN useradd --gid ${GROUP_ID} --uid ${USER_ID} ${USER_NAME}; exit 0
