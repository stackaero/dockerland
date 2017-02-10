FROM openjdk:latest

MAINTAINER vinay

RUN groupadd tomcat && useradd -g tomcat tomcat 

RUN wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz -O /opt/apache-tomcat-7.0.61.tar.gz && \
tar xvzf /opt/apache-tomcat-7.0.61.tar.gz -C /opt && \
mv /opt/apache-tomcat-7.0.61 /opt/tomcat && \
rm -rf /opt/apache-tomcat-7.0.61.tar.gz

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]






