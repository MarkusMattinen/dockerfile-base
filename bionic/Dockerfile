# Ubuntu Bionic base image with updates, fixes and useful packages installed.
FROM ubuntu:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse" > /etc/apt/sources.list \
 && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb-src mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends apt-transport-https \
 && apt-get install -y --no-install-recommends language-pack-en curl wget vim dirmngr gnupg-agent software-properties-common git-core iproute2 python3 python3-pip python3-pkg-resources python3-setuptools python3-wheel \
 && apt-get dist-upgrade -y --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && echo "LANG=en_US.UTF-8" > /etc/default/locales \
 && echo "LC_COLLATE=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_CTYPE=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_MESSAGES=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_MONETARY=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_NUMERIC=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_PAPER=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_NAME=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_ADDRESS=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_TELEPHONE=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_MEASUREMENT=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_IDENTIFICATION=en_US.UTF-8" >> /etc/default/locales \
 && echo "LC_TIME=en_US.UTF-8" >> /etc/default/locales

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN dpkg-reconfigure locales
