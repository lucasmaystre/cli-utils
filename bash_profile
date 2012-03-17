# Some aliases.
alias ll='ls -oGF'
alias lla='ls -oGFa'
alias l=less
alias propassgen='/Users/lum/Documents/propassgen/propassgen/utils/propassgen.py --source=/Users/lum/Documents/propassgen/propassgen/utils/source.xml'
alias graphviz="open /usr/local/Cellar/graphviz/2.28.0/Graphviz.app"
alias chi="ssh -l root chi.lum.li"
alias ku="ssh -l root ku.lum.li"
# Spotlight command line tool. Useful for searching in PDFs.
alias search="mdfind -onlyin ./"
PATH=$PATH":/usr/local/git/bin"
PATH=$PATH":"$HOME"/bin"
export CLICOLOR=1

# Git autocompletion
source $HOME/Documents/programmes/git-completion.bash

# mysql is not installed anymore
#alias mysql=/usr/local/mysql/bin/mysql
#alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# ack is not installed anymore...
#alias ack=ack-standalone

HISTSIZE=100000
HISTFILESIZE=100000

# Change the prompt.
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Use the home brewed psql
alias psql='/usr/local/Cellar/postgresql/9.1.2/bin/psql'
