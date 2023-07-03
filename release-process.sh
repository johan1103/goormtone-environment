#!/bin/sh

sudo docker compose pull web1 -q
sudo docker compose up --force-recreate -d web1
curl --silent --head --fail http://localhost:80/swagger-ui/index.html >> /dev/null
while [ $? -ne 0 ];
do 
    sleep 1
    curl --silent --head --fail http://localhost:80/swagger-ui/index.html >> /dev/null
done
echo -e "\033[32m"api-server 배포 성공"\033[0m" 