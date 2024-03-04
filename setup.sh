#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

_echo() {
  command printf %s\\n "$*" 2>/dev/null
}

sudo -E apt-get -qy update
sudo -E apt-get -qy upgrade

_echo "User: $USER"

# NODE
sudo snap install node --classic < /dev/null

# DOCKER
sudo snap install docker < /dev/null
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker

# #
sudo snap install code --classic < /dev/null
sudo snap install phpstorm --classic < /dev/null

sudo snap install discord < /dev/null
sudo snap install slack < /dev/null
sudo snap install beekeeper-studio < /dev/null
