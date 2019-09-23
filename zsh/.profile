# lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# editor
export EDITOR=vim

# linuxbrew
# [ -f $HOME/.linuxbrew/bin/brew ] && eval $($HOME/.linuxbrew/bin/brew shellenv)
export BREW=$HOME/.linuxbrew
export HOMEBREW_PREFIX="$BREW"
export HOMEBREW_CELLAR="$BREW/Cellar"
export HOMEBREW_REPOSITORY="$BREW/Homebrew"
# export PATH="$BREW/bin:$BREW/sbin:$PATH"
# export MANPATH="$BREW/share/man:$MANPATH"
# export INFOPATH="$BREW/share/info:$INFOPATH"
export HOMEBREW_NO_AUTO_UPDATE=1

# .local
export PATH=$HOME/.local/bin:$PATH

# cuda
[ -d /usr/local/cuda ] && CUDA_PATH=/usr/local/cuda
[ -d $HOME/.local/cuda ] && CUDA_PATH=$HOME/.local/cuda
export PATH=$CUDA_PATH/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_PATH/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# secret sauce
[ -f $HOME/.secretrc ] && source $HOME/.secretrc
