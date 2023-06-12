FROM openjdk:8
EXPOSE 8080
ADD target/docker-k8s.jar docker-k8s.jar
ENTRYPOINT ["java","-jar","/docker-k8s.jar"]
