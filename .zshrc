#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias pd='pushd'
alias seba='source env/bin/activate'
alias manage='src/manage.py'

function venv() {
  result=${PWD##*/}
  source ~/env/$result/bin/activate
}

function myip() {
  curl -w "\n" https://api.ipify.org
}

function gtag1() {
  git checkout -b floating-tag
}

function gtag2() {
  echo "Creating floating tag $1"
  git tag $1
  echo "Returning to branch master"
  git checkout master
  git branch -D floating-tag
}
