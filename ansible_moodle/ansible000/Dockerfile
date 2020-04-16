FROM ubuntu:16.04

# Actualizando lista de paquetes
RUN apt-get update

# Instalando python, pip, ssh
RUN apt-get install -y openssh-server python python-pip wget

#Configurando llave publica
RUN mkdir /var/run/sshd

COPY authorized_keys /root/.ssh/authorized_keys

RUN ["chmod","0600","/root/.ssh/authorized_keys"]

#Exponiendo puerto 22 para el uso de ssh
EXPOSE 22

CMD  ["/usr/sbin/sshd", "-D"]
