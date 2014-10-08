# base - Base Image with supervisord

FROM tianon/debian:wheezy
MAINTAINER Marek Obuchowicz <marek@korekontrol.eu>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.utf8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get -yqq install vim mc curl wget less supervisor python-pip
RUN pip install supervisor-stdout

ADD locale /etc/default/locale
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD sv_stdout.conf /etc/supervisor/conf.d/

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

CMD ["/usr/bin/supervisord"]
