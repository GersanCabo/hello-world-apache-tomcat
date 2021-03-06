FROM tomcat:jre8-temurin-focal
LABEL maintainer="gersancabo@gmail.com"

ARG WAR_FILE=target/*.war

ADD ${WAR_FILE} /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]

# ARG WILDFLY_NAME
# ARG CLUSTER_PW

#ENV WILDFLY_NAME=${WILDFLY_NAME}
#ENV CLUSTER_PW=${CLUSTER_PW}

#ENTRYPOINT /opt/jboss/wildfly/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -Djboss.server.default.config=standalone-full-ha.xml -Djboss.node.name=${WILDFLY_NAME} -Djava.net.preferIPv4Stack=true -Djgroups.bind_addr=$(hostname -i) -Djboss.messaging.cluster.password=${CLUSTER_PW}