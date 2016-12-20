# Minimal configuration shared everywhere. Should work on any UNIX-like system.
#
# Author: Lucas Maystre <lucas@maystre.ch>

# Some aliases.
alias ll='ls -ohGF'
alias lla='ls -ohGFa'
alias l=less

# Change the prompt.
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# History settings.
HISTSIZE=100000
HISTFILESIZE=100000

# Some more environment defaults.
PATH=$PATH":"$HOME"/bin"
export EDITOR=vim
export LANG=en_US.UTF-8
