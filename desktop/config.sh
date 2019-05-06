#!/bin/bash

THEME_PATH=$HOME/.themes
ICON_PATH=$HOME/.icons
LANG_SELECT_PATH=$HOME/.config/fontconfig/conf.d
FONT_PATH=$HOME/.fonts

mkdir -p $THEME_PATH
mkdir -p $ICON_PATH
mkdir -p $LANG_SELECT_PATH
mkdir -p $FONT_PATH

link themes  $HOME .themes
link icons $HOME .icons
link 64-language-selector-prefer.conf $HOME/.config/fontconfig/conf.d
for font in $(ls -d fonts/*); do
  link ${font} $HOME/.fonts
done
fc-cache -f
