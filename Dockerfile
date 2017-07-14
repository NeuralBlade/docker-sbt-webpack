FROM node:8.1.0
RUN npm install -g webpack 
RUN    echo "deb http://dl.bintray.com/sbt/debian /" |  tee -a /etc/apt/sources.list.d/sbt.list
RUN    echo "deb http://ftp.debian.org/debian jessie-backports main" |  tee -a /etc/apt/sources.list.d/backports.list
RUN    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN    apt-get update
RUN    apt-get -y upgrade
RUN    apt-get -y install openjdk-8-jdk
RUN    apt-get -y install sbt
RUN    sbt -batch
RUN    useradd -u 1001 jenkins
RUN    apt-get -y install git git-flow zip
RUN    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
       mv jq-linux64 /usr/bin/jq  && \
       chmod +x /usr/bin/jq
