# my-mac-setup

## Description

Ansible script to install my mac setup.

## Instructions



If it is the first time you use it, install python with brew, link it, update pip and link pip

Install ansible: # Recommended by ansible
python -m pip install ansible

Add ansible to path. Add to .zshrc
export PATH=“$HOME/Library/Python/3.9/bin:$PATH"


ansible-playbook Projects/setup-installator/playbooks/main.yml --ask-become-pass

If you have already installed ansible, just run the command above.

## Caveats

We installed intellij plugins manually. I need to add an automatic way to install them with ansible.
the plugins are aws CloudFormation.
