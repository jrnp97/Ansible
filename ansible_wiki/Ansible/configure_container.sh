#!/bin/bash

echo "*** Configurando contenedores ejecutando playbooks ***"

echo "--- Configurando mysql en wiki_db ---"

ansible-playbook -i hosts Mysql.yml

echo "--- Configurando apache en wiki_main ---"

ansible-playbook -i hosts Apache.yml

echo "--- Configurando MediaWiki en wiki_main ---"

ansible-playbook -i hosts MediaWiki.yml

echo "*** Configuración terminada ***"
