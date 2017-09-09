# docker-cloud9-workspace
Run and host your own Cloud9 SSH Workspace

## Usage

This image will allow you to easily set up a dockerized SSH workspace for your paid Cloud9 account. All you need to deploy your instance is the following command:

```docker run -d -p 22:22 -e AUTHORIZED_KEYS="your-c9-public-key" gisjedi/cloud9-workspace```
