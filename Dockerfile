FROM quay.io/devfile/base-developer-image:ubi9-latest
LABEL maintainer="Jason Galens"

LABEL name="devfile/pdk-developer-image"
LABEL version="ubi9"

USER 0

RUN \
  rpm -Uvh https://yum.puppet.com/puppet-tools-release-el-9.noarch.rpm; \
  dnf install -y pdk make gcc; \
  dnf clean all -y --enablerepo='*'

RUN pdk env > /etc/profile.d/pkd.sh

USER 10001
