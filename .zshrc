
alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'
eval "$(/opt/homebrew/bin/brew shellenv)"

# TODO:
# 1 - Alias para criar automaticamente venv para projeto
# 2 - Alias para atualizar dependencias python
# 3 - Alias para atualizar dependencias node
# 4 - Alias para atualizar dependencias do vscode no repo
# 5 - Alias para atualizar configs(git, vscode, bash, etc) no repo (jq para juntar json)


# create a virtualenv with
# pyenv virtualenv <py_version> <project_name>
# go to project directory and run
# pyenv local <project_name>

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true

plugins=(
    # git
    # pyenv
    # virtualenv
    docker
    poetry
)

source $ZSH/oh-my-zsh.sh



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'

function frm() {
  find `$1` -name $2 -exec rm -rf {} \;
}


export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PATH="$PATH:/Users/alvaro/.local/bin"
source "$HOME/.cargo/env"

eval "$(starship init zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv init --path -)"
eval "$(pyenv virtualenv-init -)"
