#!/usr/bin/env bash

curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
exec bash
pyenv update

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

pyenv global ipytho2 ipython2 3.6.6 2.7.15 system


curl https://raw.githubusercontent.com/AlvaroLQueiroz/dofiles/master/.gitconfig > $HOME/.gitconfig
curl https://raw.githubusercontent.com/AlvaroLQueiroz/dofiles/master/vscode.json > $HOME/.config/Code/User/settings.json
