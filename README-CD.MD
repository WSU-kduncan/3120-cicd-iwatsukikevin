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
## Container restart script (restart.sh)
- What does it do and why do we need it? = The script stops my site container, removes it, then pulls the latest version of a new image from Dockerhub, places it in a container and then runs the container. This script is necessary because it reduces how many commands we will need to use to update our images and containers.
- Where it should be on my instance (server) if someone wanted to use my setup: In my home directory (make sure it is public).
## Setting up a `webhook` on the server (branched to different sources when making this block)
- How to install `adnah's webhook` to server:
  - First, if applicable, make sure `Go` 1.14 or newer is set up then run `go build github.com/adnanh/webhook` (building from source).
  - I use `Ubuntu`, so I must install webhook with the command `sudo apt-get install webhook`.
- How to start the webhook:
  - You must first define some hooks you want `webhook` to serve with JSON format.
  - Create an empty file in `/etc/webhook.conf`. This file will contain an array of hooks `webhook` will serve.
  - The hooks file should have a line for an `id`, an `execute-command` and a `command-working-directory`.
  - The `webhooks` will depend on shell scripts, so the `execute-command` line in your hooks file must have a path to your shell script (don't forget to add `#!(whitespace)/bin/sh` at the top of your executable file!).
  - After you successfully create and save your hook file, run webhook manually using the syntax `webhook -hooks /etc/webhook.conf -verbose`.
  - Check webhook status with `sudo systemctl status webhook.service`
  - The webhook will start up on default port tcp/9000 and will provide you with one HTTP endpoint (ex. `http://yourserver:9000/hooks/json-file-id`)
## `webhook` task definition file
- What does my webhook do?
- Where it should be on my instance if someone wanted to use my setup: 
## How to Configure GitHub OR DockerHub to Message the Listener (payloads)
- GitHub:
  - Go to settings on your repository.
  - Go to `Webhooks` under `Code and automation`
  - Click on `add webhook` 
  - Enter your password, if applicable.
  - Fill out the text boxes with the appropriate information and choose the desired settings.
  - Click `add webhook` when you are done.
- DockerHub:
  - Go to your public repository.
  - Click on `Webhooks` and fill out the text lines with the appropriate information.
  - Click `Create` when finished.
## Recording of my Workflow Process (from `commit and push` TO server getting a fresh image)
- Click on `windows key` then `alt` then `R` and hold until recording widget appears.
- When you are done, click the `stop` icon.
- Bring up the game menu with `windows key` + `G`.
- Click on the `Widget Menu` at the top of the screen and go to `gallery` on the dropdown menu.
- Your video recording might take a while to load.
- `link to video here`
## Diagram of Continuous Deployment Process.
- !(image_name)[url]
