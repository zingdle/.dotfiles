#!/bin/bash

THEME_PATH=$HOME/.themes
ICON_PATH=$HOME/.icons
FONT_PATH=$HOME/.config/fontconfig/conf.d

mkdir -p $THEME_PATH
mkdir -p $ICON_PATH
mkdir -p $FONT_PATH

cp -rf $DIR/themes/* $THEME_PATH
cp -rf $DIR/icons/* $ICON_PATH
cp -rf $DIR/64-language-selector-prefer.conf $FONT_PATH
