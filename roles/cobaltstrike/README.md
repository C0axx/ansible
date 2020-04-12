Cobalt Strike
=========

Role to install Cobalt Strike and optionally start as Teamserver.

Requirements
------------

None

Role Variables
--------------

| Variable                          | Default                 | Comments (type)                                                                                                                                                                       |
| :-------------------------------- | :---------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| c2_profile_url            | http://example.com/default.profile                   | Must be a URL
| teanserver_password            | password1                   | password for your Teamserver
| license_key            | aaaa-bbbb-cccc-dddd                   | Must be a URL

Dependencies
------------

None

Example Playbook
----------------


    tasks:
        - include_role:
            name: cobalt_strike
        vars:
              c2_profile_url: https://github.com/xx0hcd/Malleable-C2-Profiles/raw/master/template.profile

You can run it like this to avoid placing your license key or password in any code.

    ansible-playbook -i inventory cobaltstrike_playbook.yml --extra-vars '{"license_key":"aaaa-bbbb-cccc-dddd","teamserver_password":"password1"}'

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).