## UBI9 Base image
FROM registry.access.redhat.com/ubi9/ubi:latest

# Update packages
RUN dnf update -y && \
    dnf clean all

## Install dependencies
RUN dnf install -y python3.12 python3.12-devel openssh-clients sshpass

## Install pip and create symlinks
RUN python3.12 -m ensurepip && \
    python3.12 -m pip install --upgrade pip && \
    ln -sf /usr/bin/python3.12 /usr/bin/python3 && \
    ln -sf /usr/bin/python3.12 /usr/bin/python && \
    ln -sf /usr/local/bin/pip3 /usr/bin/pip

## Entrypoint
CMD ["/bin/bash"]