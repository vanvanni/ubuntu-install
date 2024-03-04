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

# Packages
sudo snap install code --classic < /dev/null
sudo snap install phpstorm --classic < /dev/null

sudo snap install discord < /dev/null
sudo snap install slack < /dev/null
sudo snap install beekeeper-studio < /dev/null

# Structure
mkdir $HOME/Code
mkdir $HOME/Lib

# Tweaks
echo "alias py='python3'" >> $HOME/.bashrc
echo "alias cde='cd ~/Code'" >> $HOME/.bashrc

echo "alias gs='git status'" >> $HOME/.bashrc
echo "alias ga='git add'" >> $HOME/.bashrc
echo "alias gc='git commit'" >> $HOME/.bashrc
echo "alias gb='git checkout -b'" >> $HOME/.bashrc

echo "alias _c='clear'" >> $HOME/.bashrc
echo "alias _h='history'" >> $HOME/.bashrc

# Command Line
# // TODO