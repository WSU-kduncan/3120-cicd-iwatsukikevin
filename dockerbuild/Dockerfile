#This is my Dockerfile (edited from local).
#How to build an image with nginx (used dataset.com for assistance)
#Must use `sudo` to run commands in AWS instance

#Define nginx as the base image to start process
FROM nginx:alpine

#Define name and email address of creator
MAINTAINER IWATSUKI iwatsuki.2@wright.edu

#Associate port 80 to enable networking between container and outside world
EXPOSE 80

#Copy index.html to site content directory
COPY index.html /usr/share/nginx/html

