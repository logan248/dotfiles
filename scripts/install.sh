#!/usr/bin/env sh

set -eu

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

upgrade_packages(){
  pkg upgrade -y
}

clean_up(){
  apt autoremove -y
}

completed(){
  dpkg -s figlet &> /dev/null
  if [ $? -eq 0 ]; then
    figlet -f slant "Done!"
  fi
}

# function install(){
#   # Check if program is already installed
#   dpkg -s $1 &> /dev/null
#   if [ $? -eq 0 ]; then
#     echo "Already installed: ${1}"
#   else
#     echo "Installing: ${1}..."
#     pkg install $1 -y
#   fi
# }

upgrade_packages

pkg install clang \
  aria2 \
  htop \
  tree \
  python \
  neovim \
  ncurses-utils \
  nodejs-lts \
  ctags \
  fd \
  ripgrep \
  fzf \
  ranger \
  fontconfig-utils \
  rsync \
  dnsutils \
  man \
  ffmpeg \
  mpv \
  cmus \
  vifm \
  mc \
  figlet \
  toilet

if [ -f ./setup.sh ]; then
  ./setup.sh
fi

clean_up
completed
