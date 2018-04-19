#!/bin/bash

exists() {
  command -v "$1" >/dev/null 2>&1
}

# icons and themes
cp -rf .icons ~/.icons
cp -rf .themes ~/.themes

# pip
if exists pip; then
    cp -rf .pip ~/.pip
else
    echo 'pip not installed.'
fi

# npm
if exists npm; then
    [ ! -d ~/.npm-global ] && mkdir ~/.npm-global
    cp -rf .npmrc ~/.npmrc
else
    echo 'npm not installed.'
fi

# zsh
if exists zsh; then
    cp -rf .zshrc ~/.zshrc
else
    echo 'zsh not installed.'
fi
