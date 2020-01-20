# ansible
Trying to learn ansible one error message at a time

## Content
### Roles
- AD DC
- AD client
- Enabling RDP

### Playbooks
- Windows hacking vm - `win_hack_playbook.yml` - Configures Windows hacking VM
- vCenter cloning VM - `vcenter_clone_playbook.yml` - Clones VM in vCenter
- vCenter VM - `vcenter_vm_playbook.yml` Does both of the above

## vCenter clone playbook

Simply clones a VM in vCenter. Make note that the playbook uses `hosts: localhost` to be able to connect to vCenter using API and not through SSH, which we don't want. This makes some things a little awkward, and is why I haven't yet written a role out of this playbook.

Usage:

    ansible-playbook -i inventory vcenter_vm_playbook.yml --extra-vars '{"template_name":"kali-light-template","username":"'$(whoami)'","vm_name":"test"}'

I decided to take some variables from the command line instead of placing them in inventory, as this allows the playbook to be used dynamically in a multi-user environment where users can deploy VMs with OS selection individually. In the usage below, template name is passed manually, username is retrieved from the current user context (might not always be desireable) and whatever you want the VM to be named.

## vCenter VM playbook

To clone a VM and apply provisioning based on what OS template was selected, use the main playbook that first clones and then calls on the appropriate playbook with a conditional. All variables must be in inventory or passed on the command line. The variables are inherited into all the playbooks.

Usage: 

    ansible-playbook -i inventory vcenter_clone_playbook.yml --extra-vars '{"template_name":"kali-light-template","username":"'$(whoami)'","vm_name":"test"}'

## Windows hacking VM playbook

This is a playbook for Windows hacking VMs.

Usage:

    ansible-playbook win-hack-vm.yml -i inventory

## Todo
- Kali VM playbook
- Ubuntu VM playbook
- Try to abstract away some of the awkward things like template_name
- Make role of vCenter cloning playbook
- Roles for different purposes