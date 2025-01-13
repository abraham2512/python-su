FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Update packages
RUN microdnf update -y && \
    microdnf clean all

## Install python3.12
RUN microdnf install python3.12 python3.12-pip

## Install 
RUN microdnf install openssh-clients sshpass

# Command to run when container starts
CMD ["bash"]