FROM maven:3.9.14-eclipse-temurin-21-alpine

LABEL maintainer="vignan"

WORKDIR  /opt 

COPY . .
RUN mvn clean package -DskipTests 

RUN cp target/*.jar /opt/app.jar

EXPOSE 8081

ENTRYPOINT [ "java", "-jar" , "app.jar" ]