FROM tomcat:8.5
MAINTAINER bhanu sai surya teja <suryalucky050@gmail.com>
COPY ./target/demo.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
