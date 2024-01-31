# pull the tomcat docker image from docker hub
FROM tomcat:latest

# person who is maintinag the docker file
MAINTAINER "vnom1985@gmail.com"

# copying the the helloworld target war package from the target to destincation tomcat Container directory
COPY ./target/helloworld-2.0-SNAPSHOT.war /usr/local/tomcat/webapps/
