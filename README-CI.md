# Project 4
- Name: Kevin Iwatsuki
- Email: iwatsuki.2@wright.edu
## CI Project Overview
- The purpose of this project is to learn how to use a set of platforms called "Docker" to create software containers. These containers package code so that applications run efficiently across computing environments, which makes practicing them worthwhile. For this project, we will be using docker commands on Linux command consoles, a GitHub repository unique for this project, port 80 for the containers, nginx for the webserver, and a computer app called "Docker Desktop".
## Run Project Locally
### How to install Docker on Linux (help from `https://docs.docker.com/engine/install/ubuntu/`):
  - If you have older versions of Docker on your desktop or instance, you must uninstall them with the command `sudo apt-get remove docker docker-engine docker.io containerd runc`.
  - We must set up the Docker repository. This is important if you are installing Docker Engine for the first time on a new host machine:
    - First, you must update the `apt` package index with `sudo apt-get update` and install packages to allow apt to use a repository over HTTPS with the following lines:
    - `sudo apt-get install \`
      - `ca-certificates \`
      - `curl \`
      - `gnupg \`
      - `lsb-release`
    - Next, add Docker's official GPG key with `sudo mkdir -m 0755 -p /etc/apt/keyrings` and `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
    - Set up the repository with the following command: `echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
  - Now, we install the Docker Engine:
    - Update the `apt` package index with the command `sudo apt-get update`.
    - Install Docker Engine, containerd, and Docker Compose with command `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`.
    - If everything is done correctly and there are no unexpected problems, you can test Docker Engine with `sudo docker run hello-world`. This should download a test image and run it in a container.
### How to build the container from the `Dockerfile`:
  - To create a Dockerfile, use the command `sudo nano Dockerfile` and type in your password.
  - You must then use keywords associated with Dockerfile to create your image (keyword list can be found at `https://thenewstack.io/docker-basics-how-to-use-dockerfiles/`).
  - Use `docker build -t "image_name_of_your_choice" .` while in the same directory as the Dockerfile to create an image.
### How to Run a Container:
  - Use the syntax `docker run -dp 80:80 image_name` to run the container in the detached mode and create a mapping between the host's port 80 and the container's port 80.
  - If you want to name your container, add `--name CUSTOM_CONTAINER_NAME` in between `run` and `-dp` before invoking the command (ex. `docker run --name kevin_container -dp 80:80 kevs_image`).
  - You can also use `docker start CONTAINER_NAME` to start a container that was stopped with `docker stop CONAINER_NAME`.
### How to view the project running in the container:
  - Use the command `docker ps` to check if the container you want to run is running.
  - To view the running container/project, open a web browse and type in `http://localhost:80` (you might need to refresh).
## Create a Public Repository in DockerHub
- After you sign into your DockerHub account, go to “Repositories” at the top of the page.
- Click on “create repository”.
- Add a name and description for your repository.
- Under “visibility”, select the “public” tick dot then “create”.
## Using CLI (command line interface) and DockerHub Credentials to Authenticate with DockerHub
- Recommended Credentials: I would recommend a token instead of a password because you can revoke a token at any time without the risk of ruining your whole account if someone gets ahold of it.
- To create a token, go to your account name on DockerHub and click on "Account Settings".
- Go to Security and click on New Access Token.
- Fill out the description text box and choose desired permissions.
- Once finsihed, you will then get a prompt telling you how to use your token to login to DockerHub. You will first be required to run a `docker login -u Docker_Username` command. Then you will be prompted to enter a password, which will be randomly generated after creating your token (copy and paste it somewhere!).
- Note: When entering your password, the characters will not show, but they are there! Just have faith!
## How to Push Container Images to DockerHub without GitHub Actions
- While creating a public docker repo, you might have noticed two commands with the syntax `docker tag local-image:tagname new-repo:tagname` and `docker push new-repo:tagname` off to the right. We will need those!
- Replace “local-image:tagname” with the name of the image on your local system that you want to upload to your repo, and “new-repo:tagname” with the path of the public repo that you want to upload your image to.
- Type the tag command into WSL2 followed by the push command, using the needed information.
- You will know you succeeded if you see an image inside your public repo with your tag (assuming you made one for your public repo).
## Configuring GitHub Secrets
- How to set a secret:
  - Go to "settings" in the GitHub repository.
  - Look down the list for "security" and then "Secrets and Variables"
  - Select "Actions" then select "New repository secret"
  - Fill out the boxes (DO NOT copy + paste secret names or else the submission will be denied)
- What secrets are set for this project?
  - My DockerHub user name (tagged as DOCKER_USERNAME) and password (tagged as DOCKER_PASSWORD).
## Behavior of GitHub Workflow
- What does it do and when?
  - My workflow accesses my DockerHub account using my secrets (dockerhub username and password (token version)), builds an image with my Dockerfile in GitHub, and uploads an image to the designated public repository on DockerHub. 
  - It will run after I use the `git commit -a -m "comment"` and `git push` commands in my Linux terminal.
- What variables in workflow are custom to your project?
  - I have my own username and password (token password from DockerHub) that I placed in secrets (refer to the "Configuring GitHub Secrets" block for how to get there). Secrets can be edited.
  - In the build-push action block, I used a folder I created ("dockerbuild") for a context line so my workflow will know where my Dockerfile is.
  - Also, in my build-push action block, I used my dockerHub username and one of my public repos to tell my workflow file where to push the image it built. 
