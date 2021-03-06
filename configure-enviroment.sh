#!/usr/bin/env bash


# TODOS
# 1- Verificar e instalar zlib

if ! [ -x "$(command -v npm)" ]; then
  echo 'Node is not installed!'
  echo 'Installing node...'
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt-get install -y nodejs
  echo 'Installed!'
fi

if ! [ -x "$(command -v git)" ]; then
  echo 'Git is not installed!'
  echo 'Installing git...'
  sudo apt install -y git
  echo 'Installed!'
fi

if ! [ -x "$(command -v pyenv)" ]; then
  echo 'pyenv is not installed!'
  echo 'Installing pyenv...'
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
  exec bash
  pyenv update
  echo 'Installed!'
fi

if ! [ -x "$(command -v jq)" ]; then
  echo 'jq is not installed!'
  echo 'Installing pyenv...'
  sudo apt-get install jq
  echo 'Installed!'
fi

if ! [ -x "$(command -v code)" ]; then
  echo 'VSCode is not installed!'
  echo 'Installing VSCode...'
  # TODO
  echo 'Installed!'
fi

# Instal VSCode extensions
curl -L https://github.com/AlvaroLQueiroz/dofiles/raw/master/vscode_extensions.sh | bash

# Configure pyenv enviroments
pyenv install 2.7.15
pyenv install 3.6.6

pyenv virtualenv 2.7.15 ipython2
pyenv virtualenv 3.6.6 ipython3

pyenv activate ipython2
pip install ipython -y
pyenv deactivate

pyenv activate ipython3
pip install ipython -y
pyenv deactivate

pyenv global ipython2 ipython3 3.6.6 2.7.15 system

# Configure git
# TODO: Perguntar se deseja configurar user name do git ou usar o do repo.
curl -L https://github.com/AlvaroLQueiroz/dofiles/raw/master/.gitconfig >> $HOME/.gitconfig

# Configure VSCode settings
#TODO: Suportar diferentes SO's
curl -L https://github.com/AlvaroLQueiroz/dofiles/raw/master/vscode.json > $HOME/.config/Code/User/settings.json
# MacOS location
# curl -L https://github.com/AlvaroLQueiroz/dofiles/raw/master/vscode.json > $HOME/Library/Application\ Support/Code/User/settings.json

# Increases number of files watched by VSCode
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
sysctl -p

# Configure Terminal settings
curl -L https://github.com/AlvaroLQueiroz/dofiles/raw/master/.bashrc >> $HOME/.bashrc

# TODO
#curl -XGET https://raw.githubusercontent.com/docker/cli/master/contrib/completion/bash/docker > $(brew --prefix)/etc/bash_completion.d/docker
