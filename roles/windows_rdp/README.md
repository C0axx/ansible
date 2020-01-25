Role Name
=========

Role to enable RDP.

Requirements
------------

None

Role Variables
--------------

| Variable                          | Default                 | Comments (type)                                                                                                                                                                       |
| :-------------------------------- | :---------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| remote_desktop_enabled            | false                   | Change to true to enable

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    tasks:
        - include_role:
            name: windows_rdp
        vars:
            remote_desktop_enabled: true

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).