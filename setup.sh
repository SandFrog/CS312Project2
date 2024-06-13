#!/bin/bash
sudo apt update
sudo apt install ansible -y
#These three lines are from: https://developer.hashicorp.com/terraform/install
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
mkdir ~/.aws
touch ~/.aws/credentials
sudo mkdir /etc/ansible
printf "[minecraft_server]\n54.188.72.102 ansible_user=ubuntu ansible_ssh_private_key_file=/home/$USER/Documents/cs312project2/minecraft" | sudo tee /etc/ansible/hosts
