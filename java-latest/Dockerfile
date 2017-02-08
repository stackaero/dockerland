# Oracle Java 7 Base

FROM java:latest

MAINTAINER Doche

RUN apt-get update && apt-get install -y supervisor wget

VOLUME ["/logs"]

ADD config/supervisord.conf /etc/supervisor/supervisord.conf
ADD config/supervisor-http.ini /etc/supervisor/conf.d/supervisor-http.ini

ADD config/*.sh /etc/supervisor/
RUN chmod +x /etc/supervisor/*.sh

ENV CONFIGURE_SCRIPT /etc/supervisor/configure.sh

EXPOSE 9001

ENTRYPOINT  ["/etc/supervisor/bootstrap.sh"]
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisor/supervisord.conf"]
