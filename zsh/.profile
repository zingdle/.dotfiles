# lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# editor
export EDITOR=vim

# .local
export PATH=$HOME/.local/bin:$PATH

# cuda
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# linuxbrew
[ -f /home/$USER/.linuxbrew/bin/brew ] && eval $(/home/$USER/.linuxbrew/bin/brew shellenv)
