export PATH="/home/alvaro/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'
