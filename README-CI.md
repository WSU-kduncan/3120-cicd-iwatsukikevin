# CI Project Overview
- The purpose of this project is to learn how to use a set of platforms called "Docker" to create software containers. These containers package code so that applications run efficiently across computing environments, which makes practicing them worthwhile. For this project, we will be using docker commands on Linux command consoles, a GitHub repository unique for this project, and a computer app called "Docker Desktop".
# Run Project Locally
- How to install Docker on Linux (help from `https://docs.docker.com/engine/install/ubuntu/`):
  - If you have older versions of Docker on your desktop or instance, you must uninstall them with the command `sudo apt-get remove docker docker-engine docker.io containerd runc`.
  - Now, we must set up the Docker repository. This is important if you are installing Docker Engine for the first time on a new host machine:
    - First, you must updae the `apt` package index with `sudo apt-get update` and install packages to allow apt to use a repository over HTTPS with the following lines:
    - `sudo apt-get install \`
      - `ca-certificates \`
      - `curl \`
      - `gnupg \`
      - `lsb-release`
    - Next, add Docker's official GPG key with `sudo mkdir -m 0755 -p /etc/apt/keyrings` and `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg`
    - Set up the repository with the following command: `echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
- How to build the container from the `Dockerfile`:
- How to Run a Container:
- How to view the project running in the container:
