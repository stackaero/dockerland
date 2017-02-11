FROM ubuntu:latest

MAINTAINER Goutam

RUN apt-get update && apt-get -y install ntp && apt-get -y install python-selinux && apt-get install python-semanage\ 
    && apt-get install -y firewalld
    
ADD ntp.conf.j2  /etc/ntp.conf


COPY ntp.conf.j2  /etc/ntp.conf

#database
RUN apt-get install -y mariadb-server && apt-get install -y python-pip && pip install -U pip && \
    apt-get install python-dev libmysqlclient-dev\
    && pip install MySQL-python && apt-get install -y $PACKAGE_URL 

COPY my.cnf.j2  /etc/my.cnf

RUN touch /var/log/mysqld.log

RUN mkdir -p /var/run/mysqld

RUN apt-get update 

ENV MYSQL_VERSION=10.1 \
    HOME=/var/lib/mysql

RUN chmod 777 /var/lib/mysql

RUN chmod 777 /bin/sh*

RUN apt-get install -y ufw

RUN touch /var/run/mysqld/mysqld.sock

#web
RUN apt-get install -y apache2 php php-mysql && apt-get install -y git 

EXPOSE 80

RUN systemctl enable apache2.service && apt-get install -y wget

RUN wget https://github.com/bennojoy/mywebapp.git -O /var/www/html/webapps.git

VOLUME ["/var/lib/mysql/"]

EXPOSE 3306

ENTRYPOINT ["container-entrypoint"]

CMD ["mysqld"]