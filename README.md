# 1. Installation

## 1.1. Development

All the development work is made on your local machine and IDE. But the
web server, database, and other services are running within the VM.


### 1.2. Softwares to install

Make sure you have the latest of those. I've seen issues working with the
Vagrant environment without keeping them updated.

1. [Vagrant 2.x](http://www.vagrantup.com/)
2. [Oracle VM VirtualBox](https://www.virtualbox.org/)
3. "Salty-vagrant", Vagrant plugin (installation covered below)


### 1.3. Procedures

Feel free to contribute your setup under a different Operating System
environment that supports Vagrant.

If you want setup manually your workspace, you can follow the Salt Stack
states definitions stored in the `salt/` folder. Every definitions are space
indendted text (YAML) describing required changes that can be applied on a
blank Linux instance.

Although the provisioner is using Salt Stack, the required configurations are
concise enough to be understood without learning the syntax it uses.


#### 1.3.1. Mac OS X and Linux

This procedure assumes either Linux or Mac OS X.

**NOTE**: All files in workspace are mounted inside the VM at `/vagrant` and
the VM's default user (vagrant) has a symbolic link from
`~/workspace` pointing to it.

1. Prepare local workspace to have code checkouts ready for the VM

2. Install Vagrant provisioner plugin ("Salt stack")

        vagrant plugin install vagrant-salt

    **NOTE**: If you have issues and you already use vagrant-salt, make sure you have the latest version or remove the plugin and re-install it.

3. Run the VM

        vagrant up

    **NOTE**: The first run seem to always fail. This is because some states are about enabling apache2 modules and salt considers the return message (e.g. "To activate the new configuration, you need to run") as an error.

    Do not worry about those errors for now, just continue at next step and `state.highstate` below will give you colored error messages. That'll be easier to work with, but with last attempts, running `state.highstate` in the VM a second time fixes everything.

4. Connect to the VM, install dependencies

        vagrant ssh

    **NOTE**: If you change a file in `salt/`, you need to apply states again
    Its always good to make sure everything worked correctly, always run `state.highstate`
    to be sure all at their appropriate places.

        salt state.highstate

    *HINT!*: The `salt` command is defined in `/home/vagrant/.bash_aliases` to run
    with Salt Stack in a Masterless fashion.

    *Possible issue*: If the VM says "No command 'salt' found, did you mean...", you might have to run "vagrant provision" from outside the VM again. To fix, do:

        vagrant@wpwiki:~$ exit
        me@local:~/workspace/docs/$ vagrant provision

