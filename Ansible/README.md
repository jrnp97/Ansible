# Configuración del entorno #

En este directorio se encuentran todos los roles a usar por ansible para la configuración de los host (contenedores docker).

Se han creado 3 roles principales los cuales son:

1. Apache
2. MySQL
3. MediaWiki

Los cuales instalan e configuran todas las dependencias e requerimientos de MediaWiki que se puede encontrar en su documentación oficial [aquí](https://www.mediawiki.org/wiki/Manual:Installation_requirements)

Ademas de los roles, creamos el archivo [hosts](hosts) en el cual se configura el metodo de conexion a nuestros contenedores, y la llave a usar, especificandole los siguientes atributos

- **ansible_port=** Se especifica el puerto donde se realizara la conexion ssh
- **ansible_ssh_private_key_file=** Se especifica la ruta donde se encuentra la llave privada, si se requiere

**Ejecutando rol Apache**

Para la ejecución del rol apache se utiliza el siguiente comandos

```
ansible-playbook -i {{ ruta del directorio host }} {{ruta del playbook que ejecuta el rol}}

En nuestro caso si estuviera en el directorio Ansible/ el comando seria equivalente ha

$ ansible-playbook -i hosts Apache.yml
```

Al realizar lo anterior deberias tener una salida parecida a la siguiente

![alt-text](/img/Apache_rol.png)

Y al ingresar por nuestro navegador a http://localhost/ debemos apreciar lo siguiente

![alt-text](/img/Home_apache.png)
