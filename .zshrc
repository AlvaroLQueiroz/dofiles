###### VARIABLES ######
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PATH="$PATH:/Users/alvaro/.local/bin"
export STARSHIP_CONFIG="/Users/alvaromariano/.starship/config.toml"
export STARSHIP_CACHE="~/.starship/cache"

##### ZSH #########
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


######### ALIASES ########
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'
function frm() {
  find `$1` -name $2 -exec rm -rf {} \;
}


##### LOAD #######
source $ZSH/oh-my-zsh.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv init --path -)"
eval "$(pyenv virtualenv-init -)"