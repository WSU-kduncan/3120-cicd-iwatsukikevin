#This is my Dockerfile locted in my git repo on my AWS instance
#How to build an image with nginx (used dataset.com for assistance)
#Must use `sudo` to run commands in AWS instance
1.) Create a base container:
        Use the command `docker create --name nginx_base -p 80:80 nginx:alpine` to create a container with the name "nginx_base", the image repository "nginx" and the image tag "alpine".
2.) Inspect Images:
        Use the command `docker images -a` to show all running and stopped images.
        If you did step 1 correctly, you should see "nginx" under "REPOSITORY" and "alpine" under "TAG".
3.) Inspect containers:
        Use command `docker ps -a` to show all containers (running and stopped).
        If a container is not running, its info will not show when you type `docker ps`
4.) Start Container:
        Use the command `docker start nginx_base` to make the container "nginx_base" run.
        Go to a web browser and visit `http://localhost` to see the defualt "Welcom to nginx!" page (assuming everything was done correctly).
5.) Modify the Running Container:
        Create an `index.html` file with your own contents.
        After you're done, use the command `docker cp index.html nginx_base:/usr/share/nginx/html/index.html` to overwrite default webpage contents.
6.) Create an image from a container:
        Use `docker commit nginx_base` to save changes made in part 5.
        When you look at the images with `docker images -a`, you will see a line with "<none>" in both the REPOSITORY and TAG. The new image exists, but we need to replace the "<none>"s for easier finding.
7.) Tag the image:
        Look for the `IMAGE ID` for `<none>` with `docker images -a`.
        Use syntax `docker tag IMAGE_ID_HERE CUSTOM_IMAGE_TAG_NAME` to modify new image.
	You can also use `docker commit CONTAINER_NAME CUSTOM_IMAGE_TAG_NAME` to tag the image.
8.) Create a new container based on the image we just created:
	Use command `docker run –name NEW_CONTAINER_NAME -d -p 80:80 CUSTOM_IMAGE_TAG_NAME` to create a new container and start simultaneously.
	Optional: To delete the original container (nginx_base), stop it with `docker stop nginx_base` followed by `docker rm nginx_base`. Success if you use `docker ps -a` and there is no sign of `nginx_base`.
9.) Check:
	Look at running containers with `docker ps` and go to `http://localhost`. If you see your custom container in the running containers list and your changes are apparent in the `localhost` web page, you did all the steps correctly.
	

