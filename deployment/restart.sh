#! /bin/bash
docker stop kev_site
docker rm kev_site
docker pull iwatsukikevin/kmirepo:latest
docker run -dp 80:80 --name kev_site iwatsukikevin/kmirepo:latest
