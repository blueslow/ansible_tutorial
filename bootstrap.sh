#!/bin/bash

echo "Bootraps inorder to use ansible-playbook"
echo "Prerequsites: be able to succsefully ssh in as klaseh"
echo "and be able to sudo to root with password"

if [ "$#" = "0" ]; then
    # Run for all nodes in inventory
    ansible-playbook -u ${USER} -K bootstrap.yml
else
    # Run for specific node in inventory
    ansible-playbook - ${USER} -K -l "$@" bootstrap.yml
fi
