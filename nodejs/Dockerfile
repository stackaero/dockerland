FROM node
MAINTAINER S.Reddy <sreddy@stackdc.io>

RUN apt-get update && apt-get install -y supervisor git build-essential

ADD config/supervisord.conf /etc/supervisor/supervisord.conf
ADD config/nodejs.conf /etc/supervisor/conf.d/nodejs.conf

ADD config/*.sh* /etc/supervisor/
RUN chmod +x /etc/supervisor/*.sh
RUN useradd -d /opt/apps -m node

VOLUME ["/logs","/opt/apps"]

ENTRYPOINT  ["/etc/supervisor/bootstrap.sh"]
CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisor/supervisord.conf"]



