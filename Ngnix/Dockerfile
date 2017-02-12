FROM ubuntu:trusty
MAINTAINER nittysh

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD sites-enabled/ /etc/nginx/sites-enabled/

ADD app/ /app/

EXPOSE 80

CMD ["/usr/sbin/nginx"]