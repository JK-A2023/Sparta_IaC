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