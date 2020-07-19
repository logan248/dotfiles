#!/usr/bin/env sh

set -eu
set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

neovim_required_libries(){
  pipenv install jedi \
    pynvim \
    pylint \
    isort \
    flake8 \
    yapf
}

neovim_required_libries
