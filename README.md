# CS-312 Project 2
# Background:
- Note: This repo assumes you're running linux, these instructions will not work for Microsoft Windows

The focus of this repo is to provide 

# Requirements:
- Ansible* (tested on version 2.10.8)
- Terraform* (tested on v1.8.4)
- An AWS account
- Money for your AWS account

*Note: these tools will be installed in this guide

# How to Provision AWS:

1. First We'll want to clone this repo, you can do that by issuing the command `cd ~/Documents && git clone https://github.com/SandFrog/cs312project2.git && cd cs312project2` into the directory you want the repo to go into
2.  Next we'll need to `chmod +x ./setup.sh` in order to execute the setup script
3. Now we can run `./setup.sh` in order to install the required tools.

> Note: This guide assumes you're on Ubuntu

> Additional Note: Please read through these scripts, don't just trust some bash script someone threw onto the internet!

3. run the command `ssh-keygen`. Once it asks you for a name, enter `minecraft`.
4. 

# How to Provision Your Machine:
# Resources Used:
- For how to set up security groups: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group.html
- For how to output the IP of the instance:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-outputs