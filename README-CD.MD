# Project 5
- Name: Kevin Iwatsuki
- Email: iwatsuki.2@wright.edu
## CD Project Overview
- What am I doing? = Learning about continuous deployment (CD). Pushing multiple docker images to my DockerHub account with semanitc versioning as a means of updating websites. Also, I am learning about webhooks and listeners to display messages upon image build/update completion.
- Why am I doing it? = Semantic versioning allows me to create multiple images/websites when a certain event occurs (pushing to GitHub in this case). It also allows us to retrieve and save images from previous versions identified by the tags. Webhooks will allow us to know right away if an image container is created without us having to go to our DockerHub repo and check ourselves. These methods make up CD, which is a very efficent process since we can reduce the amount of work required to update a website. 
- What tools am I using? = DockerHub, GitHub, semantic versioning, webhooks/listeners, WSL2 (Linux), AWS instance(s)
### Diagram of Continuous Deployment Process.
- ![my_CD_diagram](https://github.com/WSU-kduncan/3120-cicd-iwatsukikevin/blob/main/images/Project%205%20Continuous%20Deployment%20Diagram%20(updated).PNG)
## How to generate a `tag` in `git`/GitHub
- First, you must make a workflow designed to connect to GitHub and add a tag of your choosing (metadata block and a `tags` block under the `push` (action) block).
- Next use the commands in the following order:
  - `git commit -am "comment"`
  - `git push` (I need to do this because `Buildx` will not find the Dockerfile to build my image otherwise; branch `main` is ahead of origin/main by 1 commit)
  - `git tag -a v*.*.*` where the `*`s are your desired version numbers (possible to do because of the workflow tags setup).
  - `git push origin v*.*.*` where the version number is the exact same as the one you used for your "git tag" command.
- If it worked, you will find the tag number you entered under the tags tab under the branch name in your GitHub main page. You will also see a green dot with a checkmark next to your action in the "Actions" page of your GitHub repo/account with your recently-pushed tag.
## Behavior of My GitHub Workflow
- What does the workflow do? = It allows you to build and push multiple docker images to DockerHub based on your tag input + latest version.
- When does it do it? = It does it when you push your tag to GitHub, but you must follow the instuctions under "How to generate a `tag` in `git`/GitHub" first.
## Link to my Docker Hub Repo 
- https://hub.docker.com/repository/docker/iwatsukikevin/kmirepo/general
## How to install Docker on an AWS Instance (help from workfall.com)
- **I could not remember how I installed Docker on my instance before, so I typed the following steps:**
- First, login to your instance (ssh for me)
- Update the installed packages and package cache on your instance with `sudo yum update -y`.
- Install the most recent Docker Engine package with `sudo amazon-linux-extras install docker`.
- Start the Docker service with `sudo service docker start`.
- **The next few lines are optional:**
- Add the ec2-user to the docker group so you can execute Docker commands without using sudo with `sudo usermod -a -G ec2-user`.
- Log out and log back in to acquire new docker group permissions. Your new session will have the appropriate docker group permissions.
- If you did everything correctly, the command `docker info` should work and show client and server (containers, running,...) data.  
## Container restart script (restart.sh)
- What does it do and why do we need it? = The script stops my site container, removes it, then pulls the latest version of a new image from Dockerhub. Next, it places the image in a container and then runs it. This script is necessary because it reduces how many commands we will need to use to update our images and containers.
- Where it should be on my instance (server) if someone wanted to use my setup: My script was placed in my `/home/ubuntu` directory for easy access. I must make sure the directory is public and the script is executable by user `chmod u+x restart.sh`.
## Setting up a `webhook` on the server (branched to different sources when making this block)
- How to install `adnah's webhook` to server:
  - I use `Ubuntu`, so I must install webhook with the command `sudo apt-get install webhook`.
- How to start the webhook:
  - You must first define some hooks you want `webhook` to serve by using the JSON format (you could use YAML too but the professor wanted us to use JSON for this project).
  - Create an empty file in any directory of your choosing (I placed it in my `/home/ubuntu` directory under the name `kev_hooks.json`). This file will contain an array of hooks `webhook` will serve.
  - The hooks file should have a line for an `id` (name of hook configuration file), an `execute-command` (path to target script, which is `restart.sh` in this case) and a `command-working-directory` (directory `restart.sh` is located).
  - Don't forget to add `#!(whitespace)/bin/sh` at the top of your executable file!.
  - After you successfully create and save your hook file, run webhook manually using the syntax `sudo webhook -hooks path/to/hook/config/file -verbose` and the instance terminal should be in "listener mode". 
    - Note: If you get a "port already in use" message, run the command `sudo systemctl stop webhook.service`. You can check webhook status with `sudo systemctl status webhook.service` while in another instance terminal. Run the webhook command again to run the listener.
  - The webhook will start up on default port tcp/9000 and will provide you with one HTTP endpoint. Syntax for webhook url is `http://yourinstanceIP:9000/hooks/webhook-file-id` (mine is `http://52.45.92.192:9000/hooks/kev-webhook`). 
  - Now, if your pushes are successfull, information should appear on the instance terminal informing the user the webhook has been found and `restart.sh` has been activated.
  - Your website should be updated afterwards.
    - Note: If you are unsuccessful, it is possible another `localhost` is interfering with your container (in my case, it is `nginx`). For me, I must type `sudo apt remove nginx` then `sudo systemctl stop nginx.service` to stop nginx from being the `localhost`. You should now be able to activate the webhook and build a container with the git commands mentioned in part 1.
## `webhook` task definition file
- What does my webhook do? - When you activate the webhook, it will enter listener mode. Whenever new images with new tags are pushed, this will invoke the `restart.sh` file, which will stop and remove an existing container and pull and run the latest image as a container named "whatever is specified in `restart.sh`". The webhook will then display the information of what happened when `restart.sh` was invoked so we will know if the build was successfull or not.
- Where it should be on my instance if someone wanted to use my setup: The `webhook` command that was installed before uses the path to the hook configuration file to run the listener. Therefore, the webhook file should be located in whatever public directory is convenient for the user. 
## How to Configure DockerHub to Message the Listener
- DockerHub:
  - Go to your public repository.
  - Click on `Webhooks` and fill out the text lines with the webhook name and a destination webhook URL (where webhook POST requests will be delivered).
  - Click `Create` when finished.
  - To view the delivery history, go to the current webhooks block and press the three-dot column at the upper-right corner of your webhook URL (menu options icon) and select "view history".
  - You should see the delivery history due past webhook activiations as well as success status, but it may take a while to show anything.
## Recording of my Workflow Process
- Used "Debut Video Capture Software" to create video
- Video was >25MB, so I placed it into Pilot Dropbox
