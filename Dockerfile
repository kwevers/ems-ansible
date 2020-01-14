FROM        registry.access.redhat.com/ubi8:latest

LABEL       maintainer="kristof.wevers@infura.eu"

COPY        ./requirements.txt ./

RUN         dnf --assumeyes --nodocs install python36 git \
              && dnf clean all \
              && rm -rf /var/cache/yum

RUN         python3 -m pip install --no-cache-dir -r requirements.txt \
              && alternatives --set python /usr/bin/python3
