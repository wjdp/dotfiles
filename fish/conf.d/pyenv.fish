set -gx PYENV_ROOT $HOME/.pyenv
status is-login; and pyenv init --path | source
fish_add_path $PYENV_ROOT/bin
