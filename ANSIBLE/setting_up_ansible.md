# How to install Ansible

1. Connect to your EC2 instance.
2. Run the following to see if you already have Ansible:
   1. `ansible --version`
3. Update and Upgrade:
   1. `sudo apt update -y`
   2. `sudo apt upgrade -y `
4. Setup:
   1. `sudo apt-get install software-properties-common`
   2. `sudo apt-add-repository ppa:ansible/ansible`
5. Update:
   1. `sudo apt update -y`
6. Install:
   1. `sudo apt install ansible -y`
7. Open secondary Git Bash terminal to scp across the .pem:
   1. `scp -i "~/.ssh/file.pem" ~/.ssh/file.pem ubuntu@<public_DNS>/.ssh`
