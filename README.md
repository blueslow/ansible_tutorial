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
<code>
[defaults]<br />
inventory = inventory<br />
private_key_file = ~/.ssh/id_ansible<br />
</code>
<br />
<br />
Runing a few ad-hoc commnads to see if it's working  
<code>
ansible all  -m ping<br> 
ansible all --list-host<br>
ansible all -m gather_facts<br>
ansible all -m gather_facts --limit nimbus102.sehlstedt.se<br>
</code>

