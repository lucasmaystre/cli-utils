# Mac-specific configuration.
#
# Author: Lucas Maystre <lucas@maystre.ch>

# Used by `ls`. Replaces `--color=auto` on BSD systems.
export CLICOLOR=1

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Spotlight command line tool. Useful for searching in PDFs.
alias search="mdfind -onlyin ./"
