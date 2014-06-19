# Ubuntu Trusty base image with updates, fixes and useful packages installed.
FROM ubuntu:trusty
MAINTAINER Markus Mattinen <markus@gamma.fi>

ENV HOME /root
ENV LANG C
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse" > /etc/apt/sources.list \
 && echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo "deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse" >> /etc/apt/sources.list \
 && echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
 && echo udev hold | dpkg --set-selections \
 && echo initscripts hold | dpkg --set-selections \
 && echo upstart hold | dpkg --set-selections \
 && dpkg-divert --local --rename --add /sbin/start \
 && dpkg-divert --local --rename --add /sbin/initctl \
 && dpkg-divert --local --rename --add /usr/bin/ischroot \
 && ln -sf /bin/true /sbin/start \
 && ln -sf /bin/true /sbin/initctl \
 && ln -sf /bin/true /usr/bin/ischroot \
 && apt-get update \
 && apt-get install -y --no-install-recommends apt-transport-https \
 && apt-get install -y --no-install-recommends language-pack-en curl wget vim software-properties-common \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && echo "LANG=en_US.UTF-8" > /etc/default/locale

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV BUILD_DATE 2014_05_26

RUN apt-get update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && dpkg-reconfigure locales \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
