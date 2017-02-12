FROM centos:centos7

MAINTAINER nittysh

RUN yum install -y  python-setuptools

RUN easy_install supervisor

RUN mkdir -p /etc/supervisord.d/ mode=755

COPY supervisord.conf /etc/supervisord.d/

COPY supervisord.service /etc/systemd/system/

WORKDIR /etc/supervisord.d/

CMD ["/usr/bin/supervisord", "-n"] 