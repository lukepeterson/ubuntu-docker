# Use the official Ubuntu base image, but based on Noble (22.04 LTS)
FROM ubuntu:noble-20240530

# Install OpenSSH server and sudo
RUN apt-get update && \
    apt-get install -y \
        openssh-server \
        sudo \
        net-tools \
        vim \
        htop \
        golang \
        strace \
        curl \
        iproute2 \
        iptables \
        traceroute \
        nginx

# Create the SSH directory
RUN mkdir /var/run/sshd

# Configure SSH to allow public key authentication and disable password authentication
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

# With passwordless login, we also need to configure passwordless sudo for the ubuntu user
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set up our SSH keys
RUN mkdir -p /home/ubuntu/.ssh && \
    chmod 700 /home/ubuntu/.ssh

# Copy my public key into the authorized_keys file
ARG PUBLIC_KEY
RUN echo "$PUBLIC_KEY" > /home/ubuntu/.ssh/authorized_keys && \
    chown -R ubuntu:ubuntu /home/ubuntu/.ssh && \
    chmod 600 /home/ubuntu/.ssh/authorized_keys

# Start the SSH service on port 22
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]