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

  sudo usermod -aG docker "$USER"

  sudo systemctl start docker
  sudo systemctl enable docker
}

install_docker_compose(){
  sudo apt update
  curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
  chmod +x docker-compose-linux-x86_64
  sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
  docker-compose version
}

if command -v docker &> /dev/null; then
  echo "Docker is already installed."

  read -rp "Do you want to reinstall Docker? (y/N): " choice_d
  case "$choice_d" in
    y|Y )
      sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io
      sudo rm -rf /var/lib/docker
      install_docker
      ;;
    * ) exit 0;;
  esac
else
  install_docker
fi

if command -v docker-compose &> /dev/null; then
  echo "Docker-compose is already installed."

  read -rp "Do you want to reinstall Docker-compose? (y/N): " choice_dc
  case "$choice_dc" in
    y|Y )
      sudo rm "$(which docker-compose)"
      install_docker_compose
      ;;
    * ) exit 0;;
  esac
else
  install_docker_compose
fi
