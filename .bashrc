alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'

# TODO:
# 1 - Alias para criar automaticamente venv para projeto
#

# create a virtualenv with
# pyenv virtualenv <py_version> <project_name>
# go to project directory and run
# pyenv local <project_name>
