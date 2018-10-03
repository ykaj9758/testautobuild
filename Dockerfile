FROM openjdk:8-jre-alpine
RUN mkdir -p /opt/tomcat
RUN addgroup -S tomcat
RUN adduser -S tomcat -G tomcat
