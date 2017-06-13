#!/bin/bash
ansible-playbook -i inventory --limit ubu ubu_apt.yml
#ansible-playbook -i inventory --limit ubu main.yml
