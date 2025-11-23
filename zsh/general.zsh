# Minimal configuration shared everywhere. Should work on any UNIX-like system.
#
# Author: Lucas Maystre <lucas@maystre.ch>

# Some aliases.
alias ll='ls -ohGF'
alias lla='ls -ohGFa'
alias l=less

# Change the prompt.
PROMPT='%F{green}[%n@%m %1~]%#%f '

# How many commands from history file are loaded into memory.
export HISTSIZE=100000
# How many commands your history file can hold.
export SAVEHIST=100000
# Path to history file
export HISTFILE=~/.zsh_history
# Share history across shells, immediately.
#setopt inc_append_history
#setopt share_history

# Emulate bash default behavior: treat `#` as comments.
setopt interactivecomments

# Some more environment defaults.
path+=($HOME"/bin")
export PATH
export EDITOR=vim
export LANG=en_US.UTF-8
