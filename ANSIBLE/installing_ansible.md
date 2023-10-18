# How to install Ansible

1. Connect to your EC2 instance.
2. Run the following to see if you already have Ansible:
   1. `ansible --version`
3. Update and Upgrade:

```
sudo apt update -y
```
```
sudo apt upgrade -y
```

4. Setup:

```
sudo apt-get install software-properties-common
```
```
sudo apt-add-repository ppa:ansible/ansible
```

5. Update:

```
sudo apt update -y
```

6. Install:

```
sudo apt install ansible -y
```

7. Open secondary Git Bash terminal to scp across the .pem:

```
scp -i ~/.ssh/file.pem ~/.ssh/file.pem ubuntu@<public_DNS>:~/.ssh
```

8. Check within your EC2 terminals SSH directory to see if the transfer was successful.

# Verify connection to App EC2:

1. Move into the .ssh directory:

```
cd ~/.ssh
```

OR

```
sudo so
```
```
cd .ssh
```
This may help later.


2. Change permissions to allow file to be used:

```
sudo chmod 400 file.pem
```

3. SSH into app instance:

```
ssh -i "file.pem" ubuntu@ec2-<ip_here>.eu-west-1.compute.amazonaws.com
```

4. Exit from app instance:

```
exit
```

# Ansible Connection:

1. Move into Ansible directory:

```
cd /etc/ansible
```

2. Open hosts file in nano:

```
sudo nano hosts
```

3. Type the following into the hosts nano:
   1. Make sure to give them different names. If you give the same name, they act as mutable variables, and the last value with the same name with be chosen, i.e., the first one will be overwritten.

```
[web]
ec2-instance-app ansible_host=<public_ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/file.pem

[db]
ec2-instance-db ansible_host=<public_ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/file.pem
```

OR

```
[web]
ec2-instance-app ansible_host=<public_ip> ansible_user=ubuntu ansible_ss_private_key_file=/home/ubuntu/.ssh/file.pem

[db]
ec2-instance-db ansible_host=<public_ip> ansible_user=ubuntu ansible_ss_private_key_file=/home/ubuntu/.ssh/file.pem
```

(Using sudo gives you super user permissions, meaning the terminal may search the root directory for the ssh folder. Specifying the home/ubuntu directory helps to specify.)


4. `sudo ansible web -m ping` OR `ansible web -m ping`
   1. Again, using sudo may search the root directory for the /.ssh directory.
   2. Here we are using the web group created in the hosts folder above to ping our app instance.
   3. The result, if correct, should be:

```
ec2-instance | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

5. Gather operating system information.

```
sudo ansible web -a "uname -a"
```

OR

```
ansible web -a "uname -a"
```


# YAML Provisioning:

NOTE: As the Ansible controller has completed update & upgrade, running this installation without updating and upgrading the target nodes will not work. Run the update_upgrade.yml script first.

1. Start by creating a YAML file for our App instance provision file:

```
sudo nano install-nginx.yml
```

2. Create a "playbook" to provision nginx web server in the web node:

```
# Create a playbook to provision nginx web server in the web node
---
# starts with three dashes.

# where do you want to install or run this playbook?
- hosts: web


# find the facts (see the logs) - optional
  gather_facts: yes


# provide admin access to this playbook - use sudo
  become: true


# provide the actual instructions - install nginx
  tasks:
  - name: provision/install/configure Nginx
    apt: pkg=nginx state=present


# ensure nginx is running/enabled
```

NOTE: YAML files traditionally (although no longer required) start with the three dashes at the top: "---". This is no longer needed, but can still be used.

# Ansible Usage:

We have now created our Ansible playbook for installing and running nginx. Let's now remotely run this in the app instance:

```
ansible-playbook install-nginx.yml
```

If it successful, we should see the following:

```
PLAY [web] ********************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************
ok: [ec2-instance]

TASK [provision/install/configure Nginx] **************************************************************************************************************************************************************************
changed: [ec2-instance]

PLAY RECAP ********************************************************************************************************************************************************************************************************
ec2-instance               : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```