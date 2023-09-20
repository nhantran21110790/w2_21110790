# Use the official image as a parent image
FROM tomcat:10.1.13-jdk21-openjdk-slim-bookworm

# Remove the default webapps from Tomcat to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN rm -rf /usr/local/tomcat/webapps/examples

# Add your WAR file to the Tomcat webapps directory
ADD demo.war /usr/local/tomcat/webapps/

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the command
CMD ["catalina.sh", "run"]

