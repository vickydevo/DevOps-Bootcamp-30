# dockerfile for spring boot application 

FROM maven:3.8.4-openjdk-21-slim

AUTHOR maintainer="vignan"

WORKDIR  /opt 

RUN mvn clean package -DskipTests 

COPY target/*.jar ./app.jar

EXPOSE 8081

ENTRYPOINT [ "java", "-jar" , "./app.jar" ]