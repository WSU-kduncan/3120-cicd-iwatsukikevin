#This is my Dockerfile (edited from local).
#How to build an image with nginx (used dataset.com for assistance)
#Must use `sudo` to run commands in AWS instance

#Define nginx:alpine as the base image to start the process.
FROM nginx:alpine

#Define name and email address of creator
MAINTAINER IWATSUKI iwatsuki.2@wright.edu

#Associate port 80 to enable networking between container and outside world
EXPOSE 80

#Copy index.html to image/site content directory
COPY . /usr/share/nginx/html 
#Can use `.` instead of `index.html` to grab all files for the site.


