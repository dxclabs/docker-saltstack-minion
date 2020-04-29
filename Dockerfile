# docker-salt-minion
# Version: 1.3
FROM centos:centos8

USER root

RUN dnf install -y \
        https://repo.saltstack.com/py3/redhat/salt-py3-repo-3000-1.el8.noarch.rpm \
        epel-release

RUN dnf clean expire-cache

RUN dnf install -y \
        python3-pycurl \
        python3-tornado \
        python3-pip \
        salt-minion

RUN dnf update -y

RUN /usr/bin/pip3 install croniter

# COPY _docker/campbell/minion /etc/salt/minion

STOPSIGNAL SIGINT
CMD /usr/bin/salt-minion
