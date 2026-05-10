# Use official Tomcat image
FROM tomcat:9.0-jdk17-temurin

# Remove default apps (optional but recommended)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]