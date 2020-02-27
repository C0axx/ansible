#!/bin/bash

# script to deploy vm in center that calls on ansible
# must be located in the same folder as ansible
export ANSIBLE_LOG_PATH=./ansible.log
OS=$1
VM_NAME=$2
TEMPLATE_NAME=""

if [ $OS == 'kali' ]; then
    #printf 'selected os %s\n', $1
    TEMPLATE_NAME='kali-2020-template'
elif [ $OS == 'ubuntu' ]; then
    TEMPLATE_NAME='ubuntu-1804-template'
elif [ $OS == 'windows' ]; then
    TEMPLATE_NAME='windows-10-1909-template'
fi

printf 'Available operating systems:\n'
printf 'kali, ubuntu, w10\n\n'
printf 'Deploying VM with OS %s and name %s.\n' $OS $VM_NAME
#ansible-playbook -i inventory vcenter_vm_playbook.yml --extra-vars '{"template_name":"'$TEMPLATE_NAME'","vm_name":"'$VM_NAME'","folder_path":"'$USER_NAME'"}'

# print post install messages
IP=$(grep -m 1 'IP:' ansible.log | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')
printf '\nYou can now access your VM %s with RDP to Windows, or SSH to Linux.\n' $VM_NAME
printf 'Access your VM with:\n'
printf 'ssh %s@%s\n\n' $OS $IP
printf 'SSH access is only possible with your private key.\n'
printf 'Default credentials for Windows is Administrator/Welcome1\n'
printf 'Happy hacking!\n'