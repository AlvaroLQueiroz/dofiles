#!/usr/bin/env bash

set -e
[ -n "$PYENV_DEBUG" ] && set -x

if [ -z "$PYENV_ROOT" ]; then
  PYENV_ROOT="${HOME}/.pyenv"
fi

colorize() {
  if [ -t 1 ]; then printf "\e[%sm%s\e[m" "$1" "$2"
  else echo -n "$2"
  fi
}

failed_checkout() {
  echo "Failed to git clone $1"
  exit -1
}

checkout() {
  [ -d "$2" ] || git clone --depth 1 "$1" "$2" || failed_checkout "$1"
}

if ! command -v git 1>/dev/null 2>&1; then
  echo "pyenv: Git is not installed, can't continue." >&2
  exit 1
fi

if [ -n "${USE_GIT_URI}" ]; then
  GITHUB="git://github.com"
else
  GITHUB="https://github.com"
fi

checkout "${GITHUB}/pyenv/pyenv.git"            "${PYENV_ROOT}"
checkout "${GITHUB}/pyenv/pyenv-doctor.git"     "${PYENV_ROOT}/plugins/pyenv-doctor"
checkout "${GITHUB}/pyenv/pyenv-update.git"     "${PYENV_ROOT}/plugins/pyenv-update"
checkout "${GITHUB}/pyenv/pyenv-virtualenv.git" "${PYENV_ROOT}/plugins/pyenv-virtualenv"
checkout "${GITHUB}/pyenv/pyenv-which-ext.git"  "${PYENV_ROOT}/plugins/pyenv-which-ext"

if [ -w ~/.bashrc ]; then
    profile="$HOME/.bashrc"
elif [ -w ~/.zshrc ]; then
    profile="$HOME/.zshrc"
elif [ -w ~/.profile ]; then
    profile="$HOME/.profile"
elif [ -w ~/.config/fish/config.fish ]; then
    profile="$HOME/.config/fish/config.fish"
else
    profile="error"
fi

case "$profile" in
    "~/.config/fish/config.fish" )
        echo >> $profile
        echo "set -x PATH \"${PYENV_ROOT}/bin\" \$PATH" >> $profile
        echo 'status --is-interactive; and . (pyenv init -|psub)' >> $profile
        echo 'status --is-interactive; and . (pyenv virtualenv-init -|psub)' >> $profile
        ;;
    "error" )
        echo "Terminal config file not found!"
        ;;
    * )
        echo >> $profile
        echo "export PATH=\"${PYENV_ROOT}/bin:\$PATH\"" >> $profile
        echo "eval \"\$(pyenv init -)\"" >> $profile
        echo "eval \"\$(pyenv virtualenv-init -)\"" >> $profile
        ;;
esac
