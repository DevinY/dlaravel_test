FROM docker:17.10.0-ce-dind
MAINTAINER Devin Yang <noreply@ccc.tc>

USER root
RUN apk update \
    apk upgrade 
RUN apk add git bash bash-completion shadow py-pip sudo
RUN pip install 'docker-compose==1.16.1'

RUN adduser -D -u 1000 dlaravel &&\
echo "dlaravel ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/dlaravel 
ENV DOCKER_HOST 127.0.0.1:2375
ENV COMPOSE_HTTP_TIMEOUT 1200

EXPOSE 2375
