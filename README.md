# Configuracion de MediaWiki con Ansible #

Para la implementación ver [aquí](https://github.com/jrnp97/Ansible_wiki#implementacion).

MediaWiki es un software libre bajo la licensia [GNU](https://en.wikipedia.org/wiki/GNU_General_Public_License),
para mas información clic [aquí](https://www.mediawiki.org/wiki/MediaWiki)

## Dependencias ##
- Servidor web
- PHP
- Servidor de base de datos.

PD: Cabe aclarar que la configuración se implementara sobre un sistema linux basado en debian (Ubuntu 16.04), con la tecnologia Docker.

### Servidor Web ###

Como se recomienda en sistemas linux, se realizara el uso de apache como tecnologia de servidor web, en la ultima version disponible
en el repositorio del sistema ubuntu *apt*.

### PHP ###

MediaWiki se encuentra escrito en PHP, y requiere de una versión igual o superior a la 5.5.9, pero soportado hasta la versión 7.
Se implementará esta ultima en la configuración.

Las extenciones requeridad en PHP son:

- [Perl Compatible Regular Expressions](https://secure.php.net/pcre)
- [Sessions](https://secure.php.net/sessions)
- [Standar PHP Library](https://secure.php.net/spl)
- [JSON](https://secure.php.net/json)
- [mbstring](https://secure.php.net/mbstring)
- [PHP OpenSSL extension](https://secure.php.net/openssl)

### Servidor de base de datos ###

Como servidor de base de datos se cuenta con la compatibilidad de las siguientes opciones:

- MySQL
- PostgreSQL
- SQLite
- Microsoft SQL server
- Oracle

De las anteriores se utilizara **MySQL** como nuestro servidor de base de datos.

## Infraestructura ##

Como ya se ha establecido se utilizará la tecnologia Docker para la construcción de los host de la Infraestructura,
y ansible para la configuración de las tecnologias seleccionadas anteriormente en cada uno de los host a utilizar.

Por lo tanto se ha ideado la siguiente Infraestructura

![alt-text](/img/structure.png)

PD: logo de docker en negro se refiere al servicio de docker, y los host con el logo de docker claro se refiere a contenedores (los cuales llamamos hosts).

Donde el **docker1**, Sera el servidor principal donde se intalará las siguientes tecnologias

- Servidor web Apache.
- PHP con las dependencias ya enlistadas.
- MediaWiki.

El **docker2**, sera el servidor de base de datos donde se intalará la **MySQL**.

Cabe resaltar los siguientes caracteristicas comunes de ambos host.

- **OS principal:** Ubuntu 16.04.
- **Servicios intalados y configurados:** SSH.

## Implementación ##

Los pasos realizados aun no estan al 100% para un entorno de producción, pero se cumple el objetivo de instalar MediaWiki, cuestiones de seguridad en esta aun no han sido implmenetadas.

Para implementar la configuración local se accede a la carpeta **Docker** por medio de la terminal y se ejecuta el script **build_dockers.sh**

Este script realizará todos los pasos explicados [aquí](https://github.com/jrnp97/Ansible_wiki/tree/master/Docker#configuracion-de-host-docker).

Despues se debe realizar la ejecución de los playbooks para ello pueden ingresar al directorio **Ansible** y ejecutar el script **configure_container.sh** para la ejecución de los roles, para terminar de configurar MediaWiki se deben seguir los pasos descritos [aquí](https://github.com/jrnp97/Ansible_wiki/tree/master/Ansible#termiando-configuranci%C3%B3n-mediawiki).

Los pasos que realiza el script se han de explicar [aquí](https://github.com/jrnp97/Ansible_wiki/tree/master/Ansible#configuraci%C3%B3n-del-entorno) con mas detalle.
