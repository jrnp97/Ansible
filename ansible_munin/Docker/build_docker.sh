#!/bin/bash

echo "*** Configurando sistema ***"

echo "--- Creando imagen ---"

docker build -t docker_server .

echo "--- Registrando Alias docker_server ---"

echo "127.0.0.1 munin_master munin_node" | sudo tee -a /etc/hosts

echo "--- Creando contenedores ---"

echo "Creando contenedores"

docker run -d -P --name munin_master -p 2221:22 -p 8080:80 docker_server

docker run -d -P --name munin_node -p 2222:22 -p 80:80 docker_server

echo "--- Cambiando los permisos a la llave privada ---"

chmod 0600 ../Keys/key

echo "--- Registrando contenedores en known_hosts de ssh ---"

echo "Registrando contenedores"

ssh -o StrictHostKeyChecking=no root@munin_master -p 2221 -i ../Keys/key hostname
ssh -o StrictHostKeyChecking=no root@munin_node -p 2222 -i ../Keys/key hostname

echo "*** Contenedores listo ***"
