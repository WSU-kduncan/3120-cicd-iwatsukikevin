# Project 5
- Name: Kevin Iwatsuki
- Email: iwatsuki.2@wright.edu
## CD Project Overview
- What am I doing? = Learning about continuous deployment to create an image and go live. Also, I am learning about pushing multiple docker images to my DockerHub account with semanitc versioning as well as learning about webhooks and listeners to display a message upon image build completion.
- Why am I doing it? = Allows us to learn how to create multiple images/websites when a certain event occurs. This is a very efficent process since this is like making a lot of things happen at once with the push of a button. Semantic versioning also allows us to retrieve and save images from previous versions identified by the tags. Also, thanks to webhooks, we will know right away if an image is created without us having to go to our DockerHub repo and check ourselves.
- What tools am I using? = DockerHub, GitHub, semantic versioning, webhooks, listeners, WSL2 (Linux), AWS instance(s)
## How to generate a `tag` in `git`/GitHub
- First, you must make a workflow designed to connect to GitHub and add a tags of your choosing (metadata block and a `tags` block under the `push` (action) block).
- Second, you must make sure the local and remote git repositories are synced, otherwise the workflow will not be able to find the Dockerfile.
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
## How to install Docker on an AWS Instance
- d
## Container restart script
- What does it do and why do we need it?
- Where it should be on server if someone wanted to use my setup
## Setting up a `webhook` on the server
- How to install `adnah's webhook` to server
- How to start the webhook
## `webhook` task definition file
- What does it do?
- Where it should be on server if someone wanted to use my setup
## How to configure GitHub OR DockerHub to message the listener
- d
## Recording of my Workflow Process (from `commit and push` TO server getting a fresh image)
- d
## Diagram of Continuous Deployment Process.
