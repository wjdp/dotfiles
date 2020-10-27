alias g=git
alias gc='git commit'

alias l='ls -l'
alias ls='lsd'
alias ll='lsd -lah --date=relative'
alias lt='ls --tree'

alias dc=docker-compose

alias psync='pass git pull && pass git push'

function prj
  cd ~/local/$argv
end
