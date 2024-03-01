#!/bin/bash

install_docker(){
  sudo apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common

  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/docker-archive-keyring.gpg >/dev/null

  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list

  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io

  sudo usermod -aG docker $USER

  sudo systemctl start docker
  sudo systemctl enable docker
}

if command -v docker &> /dev/null; then
    echo "Docker is already installed."

    read -p "Do you want to reinstall Docker? (y/N): " choice
    case "$choice" in
        y|Y )
            sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io
            sudo rm -rf /var/lib/docker
            install_docker
            ;;
        * )
            echo "Exiting without reinstalling Docker."
            exit 0;;
    esac
fi

