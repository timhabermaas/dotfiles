#! /usr/bin/env bash

set -e

mkdir -p $HOME/.config/ghostty
mkdir -p $HOME/.config/fish/conf.d
mkdir -p $HOME/.config/mise
mkdir -p $HOME/.config/git

ln -sf $PWD/ghostty/config $HOME/.config/ghostty/config
ln -sf $PWD/fish/aliases.fish $HOME/.config/fish/conf.d/aliases.fish 
ln -sf $PWD/fish/vi-bindings.fish $HOME/.config/fish/conf.d/vi-bindings.fish 
ln -sf $PWD/mise/config.toml.tmpl $HOME/.config/mise/config.toml
ln -sf $PWD/git/gitconfig $HOME/.config/git/config
