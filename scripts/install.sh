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

function install(){
  # Check if program is already installed
  dpkg -s $1 &> /dev/null
  if [ $? -eq 0 ]; then
    echo "Already installed: ${1}"
  else
    echo "Installing: ${1}..."
    pkg uninstall $1 -y
  fi
}

upgrade_packages
install clang
install aria2
install htop
install tree
install python
install neovim
install ncurses-utils
install nodejs-lts
install ctags
install fd
install ripgrep
install fzf
install ranger
install fontconfig-utils
install rsync
install dnsutils
install man
install ffmpeg
install mpv # vidro player
install cmus # music player
install vifm # file manager
install mc # file manager

#Fun stuff
install figlet
install toilet

if [ -f ./setup.sh ]; then
  ./setup.sh
fi

clean_up
completed
