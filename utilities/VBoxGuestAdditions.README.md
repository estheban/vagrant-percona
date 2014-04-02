# Install lastest VirtualBox guest additions

THE INSTALLATION OF SHARED DRIVES WILL BREAK IF YOU UPDATE AT THE MOMENT.

THIS DOCUMENT IS THEREFORE A WORK IN PROGRESS STATE.

## Procedure

If you want to install anyway, you can do like the following.

1. Find the appropriate iso file coming from your VirtualBox installation

On MacOS X, you can copy it. In this example, I am in a terminal window inside
the folder who has this file (VBoxGuestAdditions.README.md).

    cp /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso .

2. Inside the Vagrant VM, mount the ISO, install dependencies

    vagrant ssh
    sudo -s
    apt-get install dkms
    cd /vagrant/utilities
    mount -o loop VBoxGuestAdditions.iso /media/cdrom
    cd /media/cdrom
    sh ./VBoxLinuxAdditions.run
    
Do not worry about the complaint of no XOrg installed. We do not need it.

3. You should be done
