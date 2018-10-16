#!/bin/bash

# helper
config() {
  echo "configuring $1...";
  if !(command -v "$1" >/dev/null 2>&1); then
    if [ "$2" == "necessary" ]; then
      echo "$1 not installed, exiting..."
      exit 1
    else
      echo "$1 not installed, skipping..."
    fi
  else
    config_$1
  fi
}

# git
config_git() {
  cp -rf .gitconfig ~/.gitconfig
}

# pip
config_pip() {
  cp -rf .pip ~/.pip
}

# npm
config_npm() {
  cp -rf .npmrc ~/.npmrc
}

# zsh
config_zsh() {
  cp -rf .zshrc ~/.zshrc
  # oh-my-zsh
  if [ ! -d ~/.oh-my-zsh ]; then
    echo 'oh-my-zsh not installed, skipping...'
    return
  else
    cp -rf zsh/robbyrussell-fix.zsh-theme ~/.oh-my-zsh/themes
    git submodule init
    git submodule update
    cp -rf zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    cp -rf zsh/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    cp -rf .ycm_extra_conf.py ~/.ycm_extra_conf.py
  fi
}

# vim
config_vim() {
  cp -rf .vimrc ~/.vimrc
}

# sqlite3
config_sqlite3() {
  cp -rf .sqliterc ~/.sqliterc
}

config_youtube-dl() {
cp -rf .youtube-dl.conf ~/.config/.youtube-dl.conf
}

# icons and themes
cp -rf .icons ~/.icons
cp -rf .themes ~/.themes

# fonts
FONT_PATH=$HOME/.config/fontconfig/conf.d
mkdir -p $FONT_PATH
cp -rf 64-language-selector-prefer.conf $FONT_PATH

# all the others
config git necessary
config pip
config npm
config zsh
config vim
config sqlite3
config youtube-dl
