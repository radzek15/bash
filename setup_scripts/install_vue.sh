#!/bin/bash

install_node(){
  sudo apt update
  sudo apt install -y nodejs
  sudo apt install -y npm
  echo "Node: $(nodejs -v) npm: $(npm -v)"
  mkdir ~/.npm-global
  npm config set prefix '~/.npm-global'

  if [ "$(basename $SHELL)" = "zsh" ]; then
    echo 'export PATH="$(npm config get prefix)/bin:$PATH"' >> ~/.zshrc
  else
    echo 'export PATH="$(npm config get prefix)/bin:$PATH"' >> ~/.bashrc
  fi

  return $?
}

install_vue(){
  npm install -g @vue/cli
  vue --version
}

if install_node; then
  install_vue
else
  exit 1
fi
