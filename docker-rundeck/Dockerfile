FROM ubuntu

ADD root /

ENV     RUNDECK_VERSION=3.1.0
ENV     RDECK_BASE=/etc/rundeck
ENV     RDECK_JAR=$RDECK_BASE/app.jar
ENV     PATH=$PATH:$RDECK_BASE/tools/bin

ADD     http://dl.bintray.com/rundeck/rundeck-maven/rundeck-${RUNDECK_VERSION}-20190731.war $RDECK_JAR

RUN \
       apt-get -y update && \
       apt-get --allow-unauthenticated -y update && \
       apt-get --allow-unauthenticated -y install build-essential rsync openssh-client software-properties-common curl nano wget lsb-release apt-transport-https && \
       apt-get -y install openjdk-8-jdk bash curl ca-certificates openssh-client && \
       mkdir -p $RDECK_BASE && \
       curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
       add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
       apt-get --allow-unauthenticated -y update && \
       apt-get install -y docker-ce && \
       rm -Rf /var/cache/apk/*

COPY    run.sh /bin/rundeck

# Keystore
RUN     mkdir -p /var/lib/rundeck/.ssh
RUN     mkdir -p $RDECK_BASE/ssl

EXPOSE 4440/tcp

# Active Directory integration
#COPY    jaas-activedirectory.conf $RDECK_BASE/server/config/jaas-activedirectory.conf

# install dir
# ssh-keys
# logs
VOLUME  [ "$RDECK_BASE", "/var/lib/rundeck/.ssh", "$RDECK_BASE/server/logs" ]

ENTRYPOINT ["/bin/rundeck"]

