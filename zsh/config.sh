#!/bin/bash

cp -rf $DIR/.zshrc $HOME

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

cp -rf $DIR/robbyrussell-fix.zsh-theme $ZSH/themes
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
