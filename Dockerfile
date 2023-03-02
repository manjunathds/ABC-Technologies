### BUILD image
FROM maven:3-jdk-11 as builder
# create app folder for sources
RUN mkdir -p /build
WORKDIR /build
COPY pom.xml /build
#Download all required dependencies into one layer
RUN mvn -B dependency:resolve dependency:resolve-plugins
#Copy source code
COPY src /build/src
# Build application
RUN mvn package

FROM tomcat:8.0
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
COPY /build/target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/abc.war
