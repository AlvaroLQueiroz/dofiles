alias docker-clean='docker stop $(docker ps -aq);docker rm $(docker ps -aq)'

# TODO:
# 1 - Alias para criar automaticamente venv para projeto
# 2 - Alias para atualizar dependencias python
# 3 - Alias para atualizar dependencias node
# 4 - Alias para atualizar dependencias do vscode no repo
# 5 - Alias para atualizar configs(git, vscode, bash, etc) no repo


# create a virtualenv with
# pyenv virtualenv <py_version> <project_name>
# go to project directory and run
# pyenv local <project_name>
