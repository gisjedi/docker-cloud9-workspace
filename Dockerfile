FROM gisjedi/sshd:ubuntu-16.04
MAINTAINER Jonathan Meyer "https://github.com/gisjedi"

ENV USERNAME cloud9
ENV SUDO true
ENV NOPASSWD true

COPY fix-perms /fix-perms

RUN apt-get install -y apt-transport-https ca-certificates curl git software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
    && apt-get update \
    && apt-get -y install docker-ce \
    && curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
    && sudo apt-get install -y nodejs build-essential \
    && mkdir -p /workspace \
    && chmod +x /fix-perms

VOLUME ["/workspace"]

CMD ["/fix-perms"]
