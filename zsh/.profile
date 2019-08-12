# term
export TERM=xterm-24bit

# lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# editor
export EDITOR=vim

# secret sauce
[ -f $HOME/.secretrc ] && source $HOME/.secretrc

# linuxbrew
[ -f $HOME/.linuxbrew/bin/brew ] && eval $($HOME/.linuxbrew/bin/brew shellenv)

# .local
export PATH=$HOME/.local/bin:$PATH

# cuda
[ -d /usr/local/cuda ] && CUDA_PATH=/usr/local/cuda
[ -d $HOME/.local/cuda ] && CUDA_PATH=$HOME/.local/cuda
export PATH=$CUDA_PATH/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_PATH/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
