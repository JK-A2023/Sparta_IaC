# Ansible

## What is it?

- An open-source IT automation engine.
- Automates provisioning, configuration management, application deployment, orchestration.
- Allows users to define infrastructure and application configurations in code.
- Makes it easier to automate repetitive tasks and manage IT environments efficiently.

Use Ansible automation to install software, automate daily tasks, provision infrastructure, improve security and compliance, patch systems, and share automation across your organization.



## How does it work?

- Ansible connects to your nodes and pushes out small programs - "modules" - to these nodes.
- Modules are used to accomplish automation tasks in Ansible.
- These programs are written to be resource models of the desired state of the system.
- Ansible then executes these modules.
- Removes them when finished.

### Agentless

- The nodes that ansible manages do not require any software to be installed on them.
- Ansible uses SSH protocl to connect to servers and run tasks.
- Once connected, it transfers the mopdules required by your command or playbook to the remote machine(s) for execution.
- Uses YAML templates so users can program repetitive tasks to happen automatically.



![img.png](ansible_images/ansible_diag_1.png)