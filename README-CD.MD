# Project 5
- Name: Kevin Iwatsuki
- Email: iwatsuki.2@wright.edu
## CD Project Overview
- What am I doing? = Learning about continuous deployment to create an image and go live. Also, I am learning about pushing multiple docker images to my DockerHub account with semanitc versioning as well as learning about webhooks and listeners to display a message upon image build completion.
- Why am I doing it? = Allows us to learn how to create multiple images/websites when a certain event occurs (pushing to GitHub in this case). This is a very efficent process since this is like making a lot of things happen at once with the push of a button. Semantic versioning also allows us to retrieve and save images from previous versions identified by the tags. Also, thanks to webhooks, we will know right away if an image is created without us having to go to our DockerHub repo and check ourselves.
- What tools am I using? = DockerHub, GitHub, semantic versioning, webhooks, listeners, WSL2 (Linux), AWS instance(s)
## How to generate a `tag` in `git`/GitHub
- First, you must make a workflow designed to connect to GitHub and add a tag of your choosing (metadata block and a `tags` block under the `push` (action) block).
- Second, you must make sure the local and remote git repositories are synced (particularlly the `workflows` files), otherwise the workflow will not be able to find the Dockerfile.
- Next use the commands in the following order:
  - `git commit -am "comment"`
  - `git tag -a v*.*.*` where the `*` are your desired version numbers (possible to do because of the workflow tags setup).
  - `git push origin v*.*.*` where the version number is the exact same as the one you used for your "git tag" command.
- If it worked, you will find the tag number you entered under the tags tab under the branch name in your GitHub main page.
## Behavior of My GitHub Workflow
- What does the workflow do? = It allows you to build and push multiple docker images to DockerHub based on your tag input + latest version.
- When does it do it? = It does it when you push your tag to GitHub, but you must follow the instuctions under "How to generate a `tag` in `git`/GitHub" first.
## Link to my Docker Hub Repo 
- https://hub.docker.com/repository/docker/iwatsukikevin/kmirepo/general
## How to install Docker on an AWS Instance (help from workfall.com)
- First, login to your instance (ssh for me)
- Update the installed packages and package cache on your instance with `sudo yum update -y`.
- Install the most recent Docker Engine package with `sudo amazon-linux-extras install docker`.
- Start the Docker service with `sudo service docker start`.
- Add the ec2-user to the docker group so you can execute Docker commands without using sudo with `sudo usermod -a -G ec2-user`.
- Log out and log back in to acquire new docker group permissions. Your new session will have the appropriate docker group permissions.
- If you did everything correctly, the command `docker info` should work and show client and server (containers, running,...) data.  
## Container restart script 
- What does it do and why do we need it? = The script pulls a new image from Dockerhub, places it in a container, and restarts the container. This script is necessary because it reduces the frequency of automatic shutdowns or prevents them entirely. This will ensure automatic updates for our containers and images.
- Where it should be on server (DockerHub) if someone wanted to use my setup:
## Setting up a `webhook` on the server
- How to install `adnah's webhook` to server:
  - First, if applicable, make sure `Go` 1.14 or newer is set up then run `go build github.com/adnanh/webhook` (building from source).
  - I use `Ubuntu`, so I must install webhook with the command `sudo apt-get install webhook`.
- How to start the webhook:
  - You must first define some hooks you want `webhook` to serve with either JSON or YAML configuration files.
  - Create an empty file with the appropriate extension. This file will contain an array of hooks `webhook` will serve.
  - The hooks file should have a line for and `id`, and `execute-command` and a `command-working-directory`.
  - The `webhooks` will depend on shell scripts, so the `execute-command` line in your hooks file must have a path to your shell script (don't forget to add `#!(whitespace)/bin/sh` at the top of your executable file.
  - After you successfully create your hook file, run webhook using the syntax `/path/to/webhook -hooks hooks.extension -verbose`.
  - The webhook will start up on default port 9000 and will provide you with one HTTP endpoint (ex. `http://yourserver:9000/hooks/redeploy-webhook`)
## `webhook` task definition file
- What does it do?
- Where it should be on server if someone wanted to use my setup
## How to configure GitHub OR DockerHub to message the listener
- GitHub:
  - If you haven't already, use the command `npm install -g github-listener` to install the command that can detect hooks from Github when a repo is pushed.
  - You must then create a JSON or YAML file to tell the server what commands are run and the secret used in the Github hook.
- DockerHub:
## Recording of my Workflow Process (from `commit and push` TO server getting a fresh image)
- d
## Diagram of Continuous Deployment Process.
