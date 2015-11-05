FROM java:openjdk-8u45-jre

MAINTAINER Discovery Dev <adsdiscoveryteam@pillartechnology.com>
 
# RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y --force-yes sonar

RUN sed -i 's|#wrapper.java.additional.6=-server|wrapper.java.additional.6=-server|g' /opt/sonar/conf/wrapper.conf

RUN sed -i 's|#sonar.jdbc.password=sonar|sonar.jdbc.password=123qwe|g' /opt/sonar/conf/sonar.properties
RUN sed -i 's|#sonar.jdbc.user=sonar|sonar.jdbc.user=sonar|g' /opt/sonar/conf/sonar.properties
RUN sed -i 's|sonar.jdbc.url=jdbc:h2|#sonar.jdbc.url=jdbc:h2|g' /opt/sonar/conf/sonar.properties
RUN sed -i 's|#sonar.jdbc.url=jdbc:mysql://localhost|sonar.jdbc.url=jdbc:mysql://192.168.8.35|g' /opt/sonar/conf/sonar.properties 

EXPOSE 9000

CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh","console"]