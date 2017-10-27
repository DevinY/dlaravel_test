#!/bin/bash
#docker-compose up -d
docker cp bash_colors $(docker-compose ps -q):bash_colors
docker-compose exec dind chown dlaravel bash_colors
docker cp test.sh $(docker-compose ps -q):test.sh
docker-compose exec dind chown dlaravel test.sh
docker-compose exec -u dlaravel dind /test.sh
