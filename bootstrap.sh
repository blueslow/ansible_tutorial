#!/bin/bash

echo "Bootraps inorder to use ansible-playbook"
echo "Prerequsites: be able to succsefully ssh in as klaseh"
echo "and be able to sudo to root with password"

if [ "$#" = "0" ]; then
    echo " No params"
else
    echo "All params: $@"
fi
