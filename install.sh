#!/bin/bash

# helper
config() {
  echo "configuring $1...";
  if !(command -v "$1" >/dev/null 2>&1); then
    echo "$1 not installed, skipping..."
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
  if ! -d ~/.oh-my-zsh; then
    echo 'oh-my-zsh not installed, skipping...'
    return
  else
    cp -rf zsh/robbyrussell.zsh-theme ~/.oh-my-zsh/themes
    git submodule init
    git submodule update
    fi
}

# icons and themes
cp -rf .icons ~/.icons
cp -rf .themes ~/.themes

# all the others
config git
config pip
config npm
config zsh
