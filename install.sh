#!/bin/bash

SRC="$1"
USER_GROUP="$2"

if [[ -d "$SRC" ]]; then
    echo "Allready there!"
else
    mkdir -p "$HOME/dotfiles"
    SRC="$HOME/dotfiles/i3"
    git clone git@github.com:Saverio976/dotfile_i3.git "$SRC" \
        || git clone https://github.com/Saverio976/dotfile_i3.git "$SRC"
fi

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_DATA_HOME"

if [[ -d "$XDG_CONFIG_HOME/i3" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/i3 exists..."
    exit 2
fi
if [[ -d "$XDG_CONFIG_HOME/rofi" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/rofi exists..."
    exit 2
fi
if [[ -d "$XDG_CONFIG_HOME/fontconfig" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/fontconfig exists..."
    exit 2
fi
if [[ -d "$HOME/.local/share/wallpaper" ]]; then
    echo "FAILED !! ERROR !! $HOME/.local/share/wallpaper exists..."
    exit 2
fi
if [[ -d "$HOME/.local/share/fonts" ]]; then
    echo "FAILED !! ERROR !! $HOME/.local/share/fonts exists..."
    exit 2
fi

ln -sf   "$SRC/.config/i3"              "$XDG_CONFIG_HOME/i3"
ln -sf   "$SRC/.config/rofi"            "$XDG_CONFIG_HOME/rofi"
ln -sf   "$SRC/.config/fontconfig"      "$XDG_CONFIG_HOME/fontconfig"
ln -sf   "$SRC/.local/share/wallpaper"  "$HOME/.local/share/wallpaper"
ln -sf   "$SRC/.local/share/fonts"      "$HOME/.local/share/fonts"

if [[ "$USER_GROUP" != "" ]]; then
    chown -R "$USER_GROUP" "$XDG_CONFIG_HOME/i3"
    chown -R "$USER_GROUP" "$XDG_CONFIG_HOME/rofi"
    chown -R "$USER_GROUP" "$XDG_CONFIG_HOME/fontconfig"
    chown -R "$USER_GROUP" "$HOME/.local/share/wallpaper"
    chown -R "$USER_GROUP" "$HOME/.local/share/fonts"
fi
