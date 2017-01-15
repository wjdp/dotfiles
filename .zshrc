#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias pd='pushd'

function venv() {
  result=${PWD##*/}
  source ~/env/$result/bin/activate
}

function myip() {
  curl -w "\n" https://api.ipify.org
}
