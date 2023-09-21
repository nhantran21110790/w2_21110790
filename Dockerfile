# Use an image that has JDK 20 installed
FROM openjdk:20-jdk-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy the .jar file into the container
COPY ./demo.war .

# Install Tomcat
RUN apt-get update && apt-get install -y tomcat9

# Remove the default webapps from Tomcat to avoid conflicts
RUN rm -rf /var/lib/tomcat9/webapps/ROOT
RUN rm -rf /var/lib/tomcat9/webapps/examples

# Add your WAR file to the Tomcat webapps directory
ADD demo.war /var/lib/tomcat9/webapps/

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the command
CMD ["catalina.sh", "run"]


