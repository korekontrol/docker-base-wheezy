# base - Base Image with supervisord

FROM tianon/debian:wheezy
MAINTAINER Marek Obuchowicz <marek@korekontrol.eu>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Base system setup
RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install apt-utils
ADD locale /etc/default/locale
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales


# Basic packages
RUN apt-get -yqq vim mc curl wget less python-pip

# Supervisor
RUN apt-get -yqq install supervisor
RUN pip install supervisor-stdout

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD sv_stdout.conf /etc/supervisor/conf.d/


CMD ["/usr/bin/supervisord"]
