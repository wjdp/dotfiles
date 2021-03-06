# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#

source $HOME/.zprofile

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh is wrong

alias tsc='nocorrect tsc'

# Customize to your needs...

alias seba='source env/bin/activate'
alias peba='source $(pipenv --venv)/bin/activate'
alias manage='(cd src; pipenv run python manage.py &)'
alias hk=heroku

alias charm='pycharm-professional'

alias cls='workon scion'
alias fls='workon flow'
alias wgp='PASSWORD_STORE_KEY="32A193A4" PASSWORD_STORE_DIR=$HOME/.password-store-wegift pass'

alias l='ls -l'
alias ls='lsd'
alias ll='lsd -lah --date=relative'
alias lt='ls --tree'

alias ct='curl -w "    time_namelookup:  %{time_namelookup}
       time_connect:  %{time_connect}
    time_appconnect:  %{time_appconnect}
   time_pretransfer:  %{time_pretransfer}
      time_redirect:  %{time_redirect}
 time_starttransfer:  %{time_starttransfer}
                    ----------
         time_total:  %{time_total}\n" -o /dev/null -s'

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

alias ec="$EDITOR $HOME/.zshrc"
alias sc="source $HOME/.zshrc"

# Suffix alias
alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,wav,webm}=mpv
alias -s git="git clone"

alias psync="pass git pull && pass git push"
alias potp="zbarimg -q --raw ~/Pictures/otp.png | pass otp append"

function _wgp() {
  local PASSWORD_STORE_DIR=$HOME/.password-store-wegift
  _pass $*
}

function venv() {
  result=${PWD##*/}
  source ~/env/$result/bin/activate
}

function myip() {
  dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'
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

# added by travis gem
[ -f /home/will/.travis/travis.sh ] && source /home/will/.travis/travis.sh

PATH="/home/will/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/will/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/will/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/will/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/will/perl5"; export PERL_MM_OPT;

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
