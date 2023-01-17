FROM ubuntu:16.04

# Install prerequisites
#RUN apt-get -y update &amp;&amp; apt-get -y upgrade
RUN apt-get -y update
#RUN apt-get -y install pip
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
RUN mkdir /usr/local/tomcat
#RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz -O /tmp/tomcat.tar.gz
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar -zvxf apache-tomcat-9.0.71.tar.gz
RUN pwd
#RUN cd /tmp &amp;&amp; tar xvfz apache-tomcat-9.0.71.tar.gz
RUN pwd
RUN cp -Rv /tmp/apache-tomcat-9.0.71/* /usr/local/tomcat/

EXPOSE 8080
# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]

MAINTAINER bhaskarndas@gmail.com


WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/bhaskarndas/sample-war/raw/main/sampletest.war


CMD ["https://net.cloudinfrastructureservices.co.uk/usr/local/tomcat/bin/catalina.sh", "run"]
