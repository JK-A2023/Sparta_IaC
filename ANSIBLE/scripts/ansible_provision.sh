#!/bin/bash

# Update & Upgrade
sudo apt update -y
sudo apt upgrade -y 

# Setup:
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible

# Update:
sudo apt update -y

# Install:
sudo apt install ansible -y

# User information:
echo "Following this, Open secondary Git Bash terminal to scp across the .pem: scp -i ~/.ssh/file.pem ~/.ssh/file.pem ubuntu@<public_DNS>/.ssh"