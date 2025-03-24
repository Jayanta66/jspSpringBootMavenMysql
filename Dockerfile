#
# Build stage
#
FROM maven:3.8.3-openjdk-17
COPY src /
COPY pom.xml /
RUN mvn -f /pom.xml clean package



FROM openjdk:17-jdk-alpine
ARG JAR_FILE=/target/*.jar
COPY ${JAR_FILE} crm-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/crm-0.0.1-SNAPSHOT.jar"]