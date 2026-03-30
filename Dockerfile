FROM maven:3.9.12-eclipse-temurin-17-alpine AS build
ADD . /myapp
WORKDIR /myapp
RUN mvn package
FROM eclipse-temurin:17.0.18_8-jdk-noble AS runtime
RUN useradd -m -d /myapp1 -s /bin/bash devops
WORKDIR /myapp1
COPY --from=build /myapp/target/*.jar myapp2.jar
USER devops
EXPOSE 8080
CMD ["java","-jar","myapp2.jar"]