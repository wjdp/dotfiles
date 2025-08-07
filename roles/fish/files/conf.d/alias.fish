alias l='ls -l'
alias ls='lsd'
alias ll='lsd -lah --date=relative'
alias lt='ls --tree'

alias psync='pass git pull && pass git push'
alias claude='pnpx @anthropic-ai/claude-code'

function prj
  cd ~/local/$argv
end
