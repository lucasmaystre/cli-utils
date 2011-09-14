# Some aliases.
alias ll='ls -oGF'
alias lla='ls -oGFa'
alias l=less
alias chi="ssh -l root chi.lum.li"
PATH=$PATH":/usr/local/git/bin"
export CLICOLOR=1

# mysql is not installed anymore
#alias mysql=/usr/local/mysql/bin/mysql
#alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# ack is not installed anymore...
#alias ack=ack-standalone

HISTSIZE=100000
HISTFILESIZE=100000

# Change the prompt.
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# MacPorts Installer addition
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
