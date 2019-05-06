#!/bin/bash

link .zshrc $HOME
link .zprofile $HOME
link robbyrussell-fix.zsh-theme $ZSH/custom/theme

if [ ! -d $ZSH/custom/plugins/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
fi

if [ ! -d $ZSH/custom/plugins/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
fi
