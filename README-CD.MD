# Project 5
- Name: Kevin Iwatsuki
- Email: iwatsuki.2@wright.edu
## CD Project Overview
- What am I doing? = I am learning about pushing multiple docker images to my DockerHub account with semanitc versioning. Also, I am learning about webhooks and listeners.
- Why am I doing it? = Allows us to learn how to create multiple images/websites when a certain event occurs. This is a very efficent process since this is like making a lot of things happen at once with the push of a button.
- What tools am I using? = DockerHub, GitHub, semantic versioning, webhooks, listeners, WSL2 (Linux)
## How to generate a `tag` in `git`/GitHub
- First, you must make sure the local and remote git repositories are synced, otherwise the workflow will not be able to find the Dockerfile.
- Next use the commands in the following order:
  - `git commit -am "comment"`
  - `git tag -a v*.*.*` where the `*` are your desired version numbers.
  - `git push origin v*.*.*` where the version number is the exact same as the one you used for your "git tag" command.
- If it worked, you will find the tag number you entered under the tags tab under the branch name.
## Behavior of My GitHub Workflow
- What does the workflow do?
- When does it do it?
