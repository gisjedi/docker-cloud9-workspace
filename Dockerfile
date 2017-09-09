FROM gisjedi/sshd:ubuntu-16.04
MAINTAINER Jonathan Meyer "https://github.com/gisjedi"

ENV USERNAME cloud9
ENV SUDO true
ENV NOPASSWD true

RUN apt-get install -y curl git && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && sudo apt-get install -y nodejs build-essential && mkdir -p /workspace && chmod 777 /workspace

VOLUME ["/workspace"]
