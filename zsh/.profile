# lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# editor
export EDITOR=vim

# linuxbrew
# [ -f $HOME/.linuxbrew/bin/brew ] && eval $($HOME/.linuxbrew/bin/brew shellenv)
[ -d /home/linuxbrew/.linuxbrew ] && BREW=/home/linuxbrew/.linuxbrew
[ -d $HOME/.linuxbrew ] && BREW=$HOME/.linuxbrew
export BREW
export HOMEBREW_PREFIX="$BREW"
export HOMEBREW_CELLAR="$BREW/Cellar"
export HOMEBREW_REPOSITORY="$BREW/Homebrew"
# export PATH="$BREW/bin:$BREW/sbin:$PATH"
# export MANPATH="$BREW/share/man:$MANPATH"
# export INFOPATH="$BREW/share/info:$INFOPATH"
export HOMEBREW_NO_AUTO_UPDATE=1

# path
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/brewbin:$PATH

# cuda
[ -d /usr/local/cuda ] && CUDA_PATH=/usr/local/cuda
# [ -d $HOME/.local/cuda ] && CUDA_PATH=$HOME/.local/cuda
export PATH=$CUDA_PATH/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_PATH/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export GOPROXY=https://goproxy.io

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# secret sauce
source $HOME/.secretrc
