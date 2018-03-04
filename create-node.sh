#!/bin/bash
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible
ansible-playbook -K ansible/install-all.yml
source ~/.bashrc

echo "Happy Mining! Your System is now mining"
