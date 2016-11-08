#!/usr/bin/env bash
set -e

$DOT_DIR="$HOME/.dot"

if [[ ! -d "$DOTDIR" ]]; then
  echo "Installing dotfiles"
  git clone --depth=1 git@github.com:stuf/dotfiles.git "$DOTDIR"

  if [[ -f "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
  fi

  ln -s "$DOTDIR/zsh/zshrc" "$HOME/.zshrc"
else
  echo "Already installed"
fi

