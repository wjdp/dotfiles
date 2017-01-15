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

function gtag() {
  current_branch=`git rev-parse --abbrev-ref HEAD`
  git checkout -b floating-tag-$1
  echo "Creating floating tag $1"
  git tag $1
  echo "Returning to branch $current_branch"
  git checkout $current_branch
  git branch -D floating-tag-$1
}
