#!/bin/bash
ansible-playbook -i inventory --limit cent cent_yum.yml 
#ansible-playbook -i inventory --limit cent main.yml 
