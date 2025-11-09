#! /usr/bin/env bash

set -e

ln -sf $PWD/fish/aliases.fish $HOME/.config/fish/conf.d/aliases.fish 
ln -sf $PWD/fish/vi-bindings.fish $HOME/.config/fish/conf.d/vi-bindings.fish 
ln -sf $PWD/mise/config.toml.tmpl $HOME/.config/mise/config.toml
ln -sf $PWD/ghostty/config $HOME/.config/ghostty/config
