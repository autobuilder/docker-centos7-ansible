FROM centos:7
LABEL maintainer="AutoBuilder24x7"
ENV container=docker

ENV pip_packages "ansible"

# Install requirements.
RUN yum makecache fast \
 && yum -y update \
 && yum -y install epel-release \
 && yum -y install python-pip \
 && yum clean all

# Install Ansible via Pip.
RUN pip install $pip_packages

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
RUN ansible --version
