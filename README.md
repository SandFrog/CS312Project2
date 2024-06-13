# CS-312 Project 2
# Background:

# Requirements:
- Ansible (tested on version 2.10.8)
- Terraform (tested on v1.8.4)
- An AWS account
- Money for your AWS account

# How to Provision AWS:

1. First We'll want to clone this repo, you can do that by issuing the command `git clone https://github.com/SandFrog/cs312project2.git` into the directory you want the repo to go into
2.  run the command `ssh-keygen`. Once it asks you for a name, enter `minecraft`.

# How to Provision Your Machine:
# Resources Used:
For how to set up security groups: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group.html
For how to output the IP of the instance:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-outputs