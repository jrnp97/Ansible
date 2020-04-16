Apache
=========

Realizara la instalacion y configuracion de un servidor web (apache) en el server01 con moodle.

Requirements
------------

Se requiere php >= 5.0, con los siguientes modulos

- php7.0
- php7.0-xmlrpc
- php7.0-zip
- php7.0-simplexml
- php7.0-intl
- php7.0-pgsql
- php7.0-curl
- php7.0-gd
- php7.0-mbstring
- php7.0-soap
- libapache2-mod-php7.0

Este ultimo para habilitar la ejecucion de codigo php en el servidor apache.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Jaime N.
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
