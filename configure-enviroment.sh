# TODOS
# 1- Verificar e instalar zlib

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew install xz
brew install node@22
brew install git
brew install pyenv
brew install --cask visual-studio-code
brew install pipx
brew install pyenv-virtualenv
brew install --cask font-fira-code
brew intall poetry
brew install starship
rew install logi-options-plus  
rew install spotify
brew install --cask docker

pyenv install 3.10
pyenv install 3.11
pyenv install 3.12
pyenv global 3.12 3.11 3.10 system

pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument
pipx install virtualenv

# Increases number of files watched by VSCode
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
sysctl -p
