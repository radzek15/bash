#!/bin/bash

install_poetry(){
  curl -sSL https://install.python-poetry.org | python3 -
  export PATH="/home/${USER}/.local/bin:$PATH"
  poetry --version
  if [ "$(basename $SHELL)" = "zsh" ]; then
    echo 'export PATH="/home/${USER}/.local/bin:$PATH"' >> ~/.zshrc
  else
    echo 'export PATH="/home/${USER}/.local/bin:$PATH"' >> ~/.bashrc
  fi
}

update_poetry(){
  poetry self update
}

while getopts ":u" option ; do
  case $option in
    u) update_poetry;;
    ?) echo " Invalid option" && exit 1;;
  esac
done

if [ "$#" -eq 0 ]; then
  install_poetry
fi
