#!/bin/bash        

# Updates the package index
sudo apt-get update        

# Install dependencies required by Docker
sudo apt-get -y install ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add Docker to repository 
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Updates the package index
sudo apt-get update

# Install the newest version of Docker
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
