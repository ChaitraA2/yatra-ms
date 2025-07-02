FROM tomcat:9.0.52-jre11-openjdk-slim

#Install java 17
RUN apt-get update && apt-get install -y openjdk-17-jdk && apt-get clean

#Set java 17 as the default Java version
RUN update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java && \
    update-alternatives --set javac /usr/lib/jvm/java-17-openjdk-amd64/bin/javac

#Copy the JAR file into the TOMCAT webapps directory
COPY ./target/yatra-ms*.jar /usr/local/tomcat/webapps

#Expose port 8080
EXPOSE 8080

#Set the user
USER yatra-ms

#Set the working drectory
WORKDIR /usr/local/tomcat/webapps

#Start Tomcat
CMD ["catalina.sh", "run"]
