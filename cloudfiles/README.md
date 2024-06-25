Creating a virtual ubuntu proxmox template

Install cloud-init
sudo apt install cloud-init

Edit the /etc/cloud/cloud.cfg or use the one in this directory.

The cloud.cfg file in this directory have items removed.

    snap,
    byobu,
    ubuntu-advantage,
    disable-ec2-metadata,
    fan,
    landscape,
    lxd,
    puppet,
    chef,
    mcollective,
    salt-minion,
    rightscale-userdata,
    reset_rmc,
    refresh_rmc_and_interface

Inorder to make a template at least on ubuntu the contents of /etc/machine-id is used to assign ip adress instead of MAC id.
Thus clear it out by e.g.
    sudo rm /etc/machine-id; sudo touch /etc/machine-id

Also check that /var/lib/dbus/machine-id is a link to /etc/machine-id. If it is not the create
    sudo rm /var/lib/dbus/machine-id
    sudo ln -s /etc/machine-id /var/lib/dbus/machine-id
Clean apt and power off:

    sudo apt clean
    sudo poweroff

In the proxmox interface for machine in question. Select hardware and add a cloud-init disk. Then select Cloud-init and edit the field you must supply a user and password. The regenerate.
Now the machine can be converted to a template, right click opn the machine.

Clone a new machine from the template and start the machine and test it e.g. check ip adress etc.
