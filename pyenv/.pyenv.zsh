PYENV_PATH=$HOME/.pyenv

[ ! -d $PYENV_PATH ] && return

export PATH="$PYENV_PATH/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
