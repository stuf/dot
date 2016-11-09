#!/usr/bin/env zsh
set -e

CWD_DIR=$(greadlink -f $(dirname $0))

pushd "$HOME/.vim/bundle/Vundle.vim"
git reset --hard HEAD
git pull
popd

