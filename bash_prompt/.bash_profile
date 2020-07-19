# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";


# If not running interactively: exit immediately.
# Note that 'return' works because the file is sourced, not executed.
#if [[ $- != *i* ]] || [ -z "$PS1" ]; then
#  return 0
#fi;

if [ -e ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
fi

# Fix vim colors inside tmux
#if [ -n "${TMUX}" ]; then
    #alias vim="TERM=screen-256color vim"
#fi

if [ -f "$HOME/.git-completion.bash" ]; then
  source ~/.git-completion.bash
fi

# Set default editor to neovim
export EDITOR=nvim

# Load dotfiles
for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
