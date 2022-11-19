FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
EXPOSE 8089
COPY ${JAR_FILE} tpAchatProject-1.0.jar.original
ENTRYPOINT ["java","-jar","/tpAchatProject-1.0.jar.original"]