# ansible_tutorial

Tutorial for ansible, following Jay LaCroix  

Introduction  
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
  
#Part 5 elevated ad-hoc commands  
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
  
#Part 06  

#Part 07  
To be continued...  

#Part 08  

#Part 09  

#Part 10  

#Part 11  

#Part 12  

#Part 13  

#Part 14  

#Part 15  

#Part 16  







