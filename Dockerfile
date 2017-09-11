FROM gisjedi/sshd:ubuntu-16.04
MAINTAINER Jonathan Meyer "https://github.com/gisjedi"

ENV USERNAME cloud9
ENV SUDO true
ENV NOPASSWD true

COPY fix-perms /fix-perms

# Install Docker
RUN apt-get install -y apt-transport-https ca-certificates curl git software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" \
    && apt-get update \
    && apt-get -y install docker-ce \
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*

# Install NodeJS 6
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - \
    && apt-get install -y nodejs build-essential \
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*

# Setup workspace dir placeholder, setup docker for dind and add cloud9 CLI
RUN mkdir -p /workspace \
    && chmod +x /fix-perms \
    && echo "export DOCKER_HOST=tcp://dind:2375" >> /etc/profile \
    && npm install -g c9 && npm cache clean

VOLUME ["/workspace"]

CMD ["/fix-perms"]
