#! /bin/bash
docker stop kev_site
docker rm kev_site
docker ps -a
docker pull iwatsukikevin/kmirepo:latest
docker ps -a
docker run -dp 80:80 --name kev_site iwatsukikevin/kmirepo:latest
docker ps -a
