FROM centos:latest
LABEL maintainer="Srdan Srepfler"
LABEL version="0.1" description="Test Container"

# Packaged dependencies
RUN yum update -y && \
yum install git -y && \
yum install bundle rubygem-bundler ruby-devel zlib-devel -y && \
rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm && \
yum groupinstall "Development Tools" -y && \
yum install puppet-agent -y && \
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git stdlib
