MUNIN-NODE
=========

Este rol configurara el contenedor **munin_node**, como un "esclavo" en la arquitectura.

Requerimientos
------------

* Sistema basado en DEBIAN.

Variables de Rol
--------------
Este rol por el momento no cuenta con variables, pero dentro de este se pueden apreciar distintos **items**, de las que destaco

- Net::Server
- Net::Server::Fork
- Net::CIDR
- Time::HiRes

que son las dependencias de un nodo de munin, el item **Net::CIDR** se utiliza para poder utilizar sentencias **cidr_allow**, en el archivo de configuración **munin-node.conf**.

Dependencias
------------

Para su correcta ejecución no requiere la ejecución previa de otro rol.

Playbook Ejemplo
----------------

Un ejemplo de uso

    - hosts: servers
      roles:
         - munin-node

Al ejecutar el rol debe aparecer algo como lo siguiente:

![alt-text](../../../imgs/node.png)

License
-------

BSD

Author Information
------------------

Jaime Negrete
