#!/usr/bin/env sh

fonts(){
  [ ! -d "$HOME/.local/share" ] && \
    mkdir -p $HOME/.local/share
  echo "Copying ~/.config/fontconfig/ to ~/.config/fontconfig"
  [ ! -d "$HOME/.config/fontconfig" ] && \
    mkdir -p $HOME/.config/fontconfig
  cp -r $HOME/dotfiles/.config/fontconfig \
    $HOME/.config/fontconfig && \
    echo "Copying fonts to ~/.local/share..." && \
    cp -r $HOME/dotfiles/.local/share/fonts \
    $HOME/.local/share/ && \
    echo "Generating fonts cache..." && \
    fc-cache -f -v && \
    echo "Verifying if font was cached successfully..." && \
    fc-list | grep "Hack" && \
    echo "Hack font was successfully cached."
}

bash_prompt(){
  cp -r $HOME/dotfiles/bash_prompt/.aliases \
    $HOME/dotfiles/bash_prompt/.bash_prompt \
    $HOME/dotfiles/bash_prompt/.bash_profile \
    $HOME/dotfiles/bash_prompt/.dircolors \
    $HOME
}

neovim(){
  [ ! -d "$HOME/.config" ] && \
    mkdir -p $HOME/.config
  cp -r $HOME/dotfiles/.config/nvim \
    $HOME/.config
}

# Update pip
# and install some packages
verify_pip(){
  which pip &> /dev/null
  if [ $? -eq 0 ]; then
    pip install pip --upgrade
    pip install pipenv
    pip install youtube-dl
  fi
}

others(){
  cp ../.git-completion.bash ../.gitconfig ~/
}

bash_prompt
verify_pip
neovim
others
fonts
