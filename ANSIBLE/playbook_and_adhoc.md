# Ansible Playbook:

An Ansible Playbook is a blueprint of automation tasks, which are IT actions executed with limited manual effort across an inventory of IT solutions. Playbooks tell Ansible what to do to which devices.

Instead of manually applying the same action to hundreds or thousands of similar technologies across IT environments, executing a playbook automatically completes the same action for the specified type of inventory—such as a set of routers.

Playbooks are used to automate IT infrastructure, without having to do it manually on many machines.

## Deploying a Playbook:

```
sudo ansible-playbook file_name.yml
```

# Ad-Hoc Commands:

An Ad-Hoc command are commands used for simple tasks that don't need to be repeated - one off tasks.

One example could be to check the operating system of the target system:

```
sudo ansible web -a "uname -a"
```

OR

```
ansible web -a "uname -a"
```

