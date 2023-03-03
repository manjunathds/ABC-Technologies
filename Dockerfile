### BUILD image
#FROM maven:3-jdk-11 as builder
# create app folder for sources
#RUN mkdir -p /build
#WORKDIR /build
#COPY pom.xml /build
#Download all required dependencies into one layer
#RUN mvn -B dependency:resolve dependency:resolve-plugins
#Copy source code
#COPY src /build/src
# Build application
#RUN mvn package

# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0-jdk11

# Set the working directory to /app
WORKDIR /app

# Copy the WAR file to the container's /app directory
COPY c:/Users/manju/.jenkins/workspace/test3/target/ABCtechnologies-1.0.war /app

# Remove the default Tomcat welcome page
RUN rm -rf $CATALINA_HOME/webapps/ROOT/*

# Copy the myapp.war file to the ROOT directory of the Tomcat webapps folder
RUN cp /app/ABCtechnologies-1.0.war $CATALINA_HOME/webapps/ROOT.war

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
