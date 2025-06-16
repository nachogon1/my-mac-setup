# my-mac-setup

## Description

Ansible script to install my mac setup.

## Requirements

Mac

zsh Terminal

## Instructions


If it is the first time you use it, install ansible first. You should use initial-script.sh (still only for mac). For that you should manually install chrome, sign-in log in git and download the script.

Install ansible: # Recommended by ansible
 Ansible should be installed if you ran initial-script.sh. The designated environment is `ansible-env`

Add ansible to path. Add to .zshrc
`export PATH=“$HOME/Library/Python/3.9/bin:$PATH"`

Then run:

`ansible-playbook Projects/setup-installator/playbooks/main.yml --ask-become-pass`

If you have already installed ansible, just run the command above.

## Caveats

We installed intellij plugins manually. I need to add an automatic way to install them with ansible.
the plugins are aws CloudFormation.
