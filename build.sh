set -ex

USERNAME=andthensome
IMAGE=alpine-hugo-git-bash

sudo docker build -t $USERNAME/$IMAGE:latest .
