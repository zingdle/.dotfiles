#!/bin/bash

THEME_PATH=$HOME/.themes
ICON_PATH=$HOME/.icons
LANG_SELECT_PATH=$HOME/.config/fontconfig/conf.d
FONT_PATH=$HOME/.fonts

mkdir -p $THEME_PATH
mkdir -p $ICON_PATH
mkdir -p $LANG_SELECT_PATH
mkdir -p $FONT_PATH

cp -rf $DIR/themes/* $THEME_PATH
cp -rf $DIR/icons/* $ICON_PATH
cp -rf $DIR/64-language-selector-prefer.conf $LANG_SELECT_PATH
cp -rf $DIR/fonts/* $FONT_PATH
fc-cache -f
