#!/usr/bin/env bash
set -e

$DOT_DIR="$HOME/.dot"

if [[ ! -d "$DOTDIR" ]]; then
  echo "Installing dotfiles"
  git clone --depth=1 git@github.com:stuf/dotfiles.git "$DOTDIR"

  if [[ -f "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
    echo "I made a backup of your \`.zshrc\`, called `\.zshrc.backup`\. Just FYI!"
  fi

  ln -s "$DOTDIR/zsh/zshrc" "$HOME/.zshrc"

  # Check if Homebrew is installed
  if [[ ! -x $(which brew) ]]; then
    echo "Installing Homebrew. This will ask for your password."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "Homebrew installation done."
  fi

  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Already installed"
fi

