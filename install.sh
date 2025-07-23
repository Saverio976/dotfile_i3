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

if [[ -d "$XDG_CONFIG_HOME/i3" ]]; then
    echo "FAILED !! ERROR !! $XDG_CONFIG_HOME/i3 exists..."
    exit 2
fi

ln -sf   "$SRC/.config/i3"     "$XDG_CONFIG_HOME/i3"

if [[ "$USER_GROUP" != "" ]]; then
    chown -R "$USER_GROUP" "$XDG_CONFIG_HOME/i3"
fi
