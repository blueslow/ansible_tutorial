# Ansible tutorial

Tutorial for ansible, following Jay LaCroix  

# Introduction  
Install openssh-server on servers.  
Install openssh-client on ansible server.  
Generate personal key, password protected and ansible key with out password.  
Install public keys on servres.  
Install git on ansible server.  
config git, e.g.  
git config --global user.name "full name"  
git config --global user.email  full@name.se  
Linux:  
git config --global core.autocrlf input
or create a .gitattributes file in project root..  
Create repository, e.g either on github or own git server.  
Install public password åprotected key in git repository server.
SSH clone repository. Change to git project  

Created inventory of hosts  
Created ansible.cfg:  
nano ansible.cfg   

    [defaults]  
    inventory = inventory  
    private_key_file = ~/.ssh/id_ansible  


Runing a few ad-hoc commnads to see if it's working  

    ansible all  -m ping # A ping pong test  
    ansible all --list-host # lists the hosts in the inventory file  
    ansible all -m gather_facts # reports facts about the hosts in the invetory file  
    ansible all -m gather_facts --limit nimbus102.sehlstedt.se # same as above but only for nimbus102  

# Part 5 elevated ad-hoc commands  
Note this requiers that the user on the remote server are allowed to use sudo.,e.g. belongs to the sudo group
Can be achived with following command as root on each server in the inventory list:  
    usermod -aG sudo username    

Now try following:  

    ansible all -m apt -a update_cache=true # Fails needs sudo  

The --become -> ask to sombody else.  
The --ask-become-pass -> ask for password e.g. sudo   

    ansible all -m apt -a update_cache=true --become --ask-become-pass # works  

Check /var/log/apt on a apointed server. To install packages:  

    ansible all -m apt -a name=vim-nox --become --ask-become-pass  
    ansible all -m apt -a name=tmux --become --ask-become-pass  

The above will install the packages if not already installed.  

    ansible all -m apt -a name=tmux --become --ask-become-pass  
The above will fail because tmux is already installed.  

    ansible all -m apt -a "name=tmux state=latest" --become --ask-become-pass  
The above will install lastest version if available and belongs to a "higher version"  
The below will upgrade to new version, if avaiable.  

    ansible all -m apt -a "upgrade=dist" --become --ask-become-pass  

# Part 06  
Added support for install and remove apache. It also add php support for apache management.  
See files install_apache.yml and  remove_apache.yml   
# Part 07  
Added Centos server and install of apache and php support for CentOS.  

The ansible when: statment can be rewritten as:  

    when: ansible_distribution in ["Debian", "Ubuntu"]  

to work for both distributions. Other variants are possible, e.g.

    when: ansible_distribution == "CentOS" and ansible_distribution_versions == "8.3"  

to pin point a specifict distribution and its version. In fact any variable from gather facts command,  

    ansible all -m gather_facts  

 can be used in logical expression as a when selector. Another example:  

    ansible all -m gather_facts --limit  nimbus105.sehlstedt.se | grep ansible_distribution  
        "ansible_distribution": "CentOS",  
        "ansible_distribution_file_parsed": true,  
        "ansible_distribution_file_path": "/etc/redhat-release",  
        "ansible_distribution_file_variety": "RedHat",  
        "ansible_distribution_major_version": "8",  
        "ansible_distribution_release": "NA",  
        "ansible_distribution_version": "8.3",  

Note:CentOS do not start the httpd servcie automatically or fix the firewall. I set up the CentOS as a container in proxmox, ANd had to separately add user and sudo, sudoers and openssh client and server and ssh keys. THe container used didn't have firewall so that was skipped. These things could of courser be automated as well.


# Part 08  
Reorganisation of playbook. The two playbooks, install_apache.yml and remove_apache.yml are refactored. To get that to work the the inventory file is changed as well to contain variable assignments per host that is used in the playbooks.   

# Part 09  
Targeting specific nodes(hosts). Groupes of host is introduced in the inventory file.
A site.yml file was created that have tasks to be executed by all hostsand groups of task to excecuted of only by the hosts that belonged to the specific group. The groups introduced was web_servers, file_servers and db_servers.

Note the tasks in the hosts all section was changed to pre_task to ensure that this task is executed before the all other host section's tasks in the file.

Taks changethe inventory to contain the grouups definition and the host variables. To get the remove_apache work again. Also chnaged the site.yml to enable an start the httpd service on CentOS machines.
 
# Part 10  

# Part 11  
To be continued...  

# Part 12  

# Part 13  

# Part 14  

# Part 15  

# Part 16  
