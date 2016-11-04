#!/usr/bin/env bash

# Ensure running as regular user
if [ $(id -u) -eq 0 ] ; then
    echo "Please run as a regular user"
    exit 1
fi

# Install newer version of Ansible
if ! type ansible > /dev/null; then
  sudo apt-get -y install software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get -y install ansible
fi

# Add nvidia-docker role from Ansible Galaxy
# ansible-galaxy install -r requirements.yml --roles-path=.

# Write playbook
playbook=$(mktemp)
cat <<EOF > $playbook
- hosts: all
  roles:
    - role: 'ryanolson.vim'
EOF

# Execute playbook
#ansible-playbook --ask-become-pass -i "localhost," -c local $playbook
ansible-playbook -i "localhost," -c local $playbook

# cleanup
rm -f $playbook
exit
