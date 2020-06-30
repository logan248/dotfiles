#!/usr/bin/env sh

set -eu

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

upgtade_packages(){
	pkg upgrade
}

install_packages(){
	pkg install clang \
		python \
		neovim \
		ncurses-utils \
		nodejs-lts \
		ctags \
		fd \
		git \
		ripgrep \
		fzf \
		ranger \
		fontconfig-utils
}

clean_up(){

	apt autoremove

}


install_required_libries(){
	pip install pip --upgrade && \
		pip install pipenv && \
		pipenv install jedi \
		pynvim \
		black \
		pylint \
		isort \
		flake8 \
		yapf
}


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
		$HOME/.config && \
		nvim
	cp -r $HOME/dotfiles/.config/nvim \
		$HOME/.config
}

automation(){
	upgtade_packages && \
		install_packages && \
		clean_up && \
		# install_required_libries && \
		fonts && \
		bash_prompt && \
		neovim

}

automation

#if [[ "$OSTYPE" =~ ^linux ]]; then
#	echo "Sit back and relax..."
#	automation && \
#		echo "Process completed successfully."
#	echo "Please restart shell and enjoy!!1"
#fi


neovim_required_libries(){
	pipenv install jedi \
		pynvim \
		pylint \
		isort \
		flake8 \
		yapf
}

#neovim_required_libries
