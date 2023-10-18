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

# Configuring Hosts:

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


4. Ping both the web and db instances:
   1. Again, using sudo may search the root directory for the /.ssh directory.
   2. Here we are using the web group created in the hosts folder above to ping our app instance.
   

```
sudo ansible web -m ping 
```

OR

```
ansible web -m ping
```

The result, if correct, should be:

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


