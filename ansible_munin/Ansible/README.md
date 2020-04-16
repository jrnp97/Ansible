# Configuracion de contendores #

Llegados a este punto, los contenedores deben crearse y estar accesibles por ssh, para comprobar que ansible puede conectarse correctamente a estos, podemos ejecutar en playbook **test.yml**, de la siguiente forma

`$ ansible-playbook -i hosts test.yml`

Cabe aclarar que el anterior comando se debe ejecutar posicionados en esta carpeta (Ansible), su ejecución generá la siguiente salida

![alt-text](../imgs/test.png)

Si sale algún verifique los pasos seguidos, de lo contrario continuemos.

Cabe aclarar la tecnologia instalada en cada uno de nuestros contenedores, la tecnologia es instalada por cada rol sera profundizada en la explicación de cada uno, a continuacion las enlistaremos.

## munin_node ##

Este contenedor funcionará como nodo esclavo, en la arquitectura y contara con una pagina dinamica (cambia su contenido por cada peticion), sobre el servidor web apache, en resumen cuenta con lo siguiente

* Web Server Apache
* Munin-node
* Perl 5 or newer
* Modulos de perl

Para la Configuracion de este contenedor se hace uso de 2 roles que son

* apache
* munin-node

## munin_master ##

Este contenedor funcionará como en nodo master de munin el cual se conectará al nodo esclavo para recolectar información sobre este, por medio del **puerto 4949**, en resumen se instalará

* Perl 5 or newer
* munin
* Modulos de perl
