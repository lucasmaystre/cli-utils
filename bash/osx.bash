# Mac-specific configuration.
#
# Author: Lucas Maystre <lucas@maystre.ch>

# Used by `ls`. Replaces `--color=auto` on BSD systems.
export CLICOLOR=1

# Starting with macOS Catalina, bash is deprecated.
export BASH_SILENCE_DEPRECATION_WARNING=1

# Spotlight command line tool. Useful for searching in PDFs.
alias search="mdfind -onlyin ./"
# QuickLook debug tool.
alias ql="qlmanage -p"
