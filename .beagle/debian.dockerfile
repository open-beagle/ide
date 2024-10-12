ARG BASE
FROM ${BASE}

ARG AUTHOR
ARG VERSION
LABEL maintainer=${AUTHOR} version=${VERSION}

ENV PATH=/opt/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/glibc-compat/lib:/usr/lib
ENV _CONTAINERS_USERNS_CONFIGURED=""

ARG TARGETOS
ARG TARGETARCH

RUN apt update -y && \
  apt install -y build-essential pkg-config python3 connect-proxy openssh-server git curl vim iputils-ping podman crun ca-certificates fuse-overlayfs sudo openssh-client && \
  apt install -y file wget && \
  apt clean && \
  sed -i 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/g' /etc/ssh/sshd_config && \
  sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
  ssh-keygen -A

RUN adduser --gecos '' --disabled-password code && \
  echo "code ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd 

USER code
