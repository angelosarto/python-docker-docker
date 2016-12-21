FROM python:3.5

RUN apt-get purge "lxc-docker*" \
    || apt-get purge "docker.io*" \
    || apt-get update \
    && apt-get install -y apt-transport-https ca-certificates gnupg2

RUN apt-key adv \
       --keyserver hkp://ha.pool.sks-keyservers.net:80 \
       --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list

COPY dummy.txt /dev/null

RUN apt-get update \
    && apt-get install -y docker-engine
