#!/bin/bash
echo "Eliminando todo los contenedores"

for i in "$( docker container ls -a | awk '{print $1}')"
do
echo "Eliminando contenedor $i"
docker container rm $i -f
done


echo "Preparando entorno"
echo "Creando imagen server:16.04"


docker build -t server:16.04 .


echo "Imagen creada, limpiando host en server ssh"

echo '' > /home/jaime/.ssh/know_hosts

echo "Registrando alias de los contenedores"

echo "127.0.0.1 server01 server02 server03" | sudo tee -a /etc/hosts

echo "Creando contenedor #1"

docker run -d -P --expose 80 --name server01 -p 2221:22 -p 80:80 server:16.04

echo "Creando contenedor #2"

docker run -d -P --expose 3306 --name server02 -p 2222:22 -p 3306:3306 server:16.04

echo "Creando contenedor #3"
docker run -d -P --expose 6379 --name server03 -p 2223:22 -p 6379:6379 server:16.04

echo "Registrando docker en SSH"

ssh -o StrictHostKeyChecking=no root@server01 -p 2221 -i key.private hostname
ssh -o StrictHostKeyChecking=no root@server02 -p 2222 -i key.private hostname
ssh -o StrictHostKeyChecking=no root@server03 -p 2223 -i key.private hostname
