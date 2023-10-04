FROM jenkins/jenkins:lts

USER root

# Install dependencies for Docker
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Install Docker using official installation script
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

USER jenkins
