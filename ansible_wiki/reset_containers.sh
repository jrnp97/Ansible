#!/bin/bash

echo "*** Recreando contenedores ***"

echo "--- Eliminando contenedores wiki_main  wiki_db ---"

docker container rm wiki_main wiki_db -f

echo "--- Recreando contenedores wiki_main wiki_db ---"

docker run -d -P --name wiki_main -p 2221:22 -p 80:80 wiki_host
docker run -d -P --name wiki_db -p 2222:22 -p 3306:3306 wiki_host

echo "*** Contenedores recreados ***"
