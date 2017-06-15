#!/bin/bash
ansible-playbook -i inventory --limit $1 cent_yum.yml 
ansible-playbook -i inventory --limit $1 main.yml 
