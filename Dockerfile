FROM java:8
VOLUME /tmp
EXPOSE 8080
#ADD http://nexusrepo-nexus.cloudapps-5957.oslab.opentlc.com/content/repositories/releases/org/mong-ci/main/mong-jar/2.234/mong-jar-2.234.jar app.jar
ADD ./target/sampledemo-0.0.1-SNAPSHOT.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
