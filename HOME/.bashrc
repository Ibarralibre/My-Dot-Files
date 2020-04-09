
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -v --color=auto'
PS1='[\u@\h \W]\$ '




#---------------------------------------------------------------#
						#SELF ADDED
#---------------------------------------------------------------#
# set up to use vi command editing mode
set -o vi

#Allows you to cd into directory by typing the directory name
shopt -s autocd


# Zsh can invoke the manual for the command preceding the cursor by pressing Alt+h
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'

#---------------------------------------------------------------#
# 				Shell exits even if ignoreeof set
#---------------------------------------------------------------#
# If you have set the ignoreeof option and you find that repeatedly hitting ctrl-d 
# causes the shell to exit, it is because this option only allows 10 consecutive 
# invocations of this keybinding (or 10 consecutive EOF characters, to be precise), 
# before exiting the shell.
# To allow higher values, you have to use the IGNOREEOF variable.
# For example: export IGNOREEOF=100
export IGNOREEOF=100
#---------------------------------------------------------------#

#---------------------------------------------------------------#
# 				Common programs and options
#---------------------------------------------------------------#
# By default, Bash only tab-completes commands, filenames, and variables.
# The package bash-completion extends this by adding more specialized tab completions 
# for common commands and their options, which can be enabled by 
# sourcing /usr/share/bash-completion/bash_completion.  With bash-completion, normal completions 
# (such as $ ls file.*<tab><tab>) will behave differently; however, they can be re-enabled 
# with $ compopt -o bashdefault program
source /usr/share/bash-completion/bash_completion

#---------------------------------------------------------------#




#---------------------------------------------------------------#
# 					Command not found
#---------------------------------------------------------------#
# pkgfile includes a "command not found" hook that will automatically 
# search the official repositories,when entering an unrecognized command.
# You need to source the HOOK to enable it

# source /usr/share/doc/pkgfile/command-not-found.bash

# Then attempting to run an unavailable command will show the following info:
# $ abiword
# abiword may be found in the following packages:
#   extra/abiword 3.0.1-2	/usr/bin/abiword
# Note: The pkgfile database may need to be updated before this will work.
# See pkgfile#Installation for details.
# An alternative "command not found" HOOK is provided by command-not-foundAUR, which looks like this:
# $ abiword
# The command 'abiword' is provided by the following packages:
# abiword (2.8.6-7) from extra
# 	[ abiword ]
# abiword (2.8.6-7) from staging
# 	[ abiword ]
# abiword (2.8.6-7) from testing
# 	[ abiword ]
#---------------------------------------------------------------#






#---------------------------------------------------------------#








#---------------------------------------------------------------#
						#HISTORY
#---------------------------------------------------------------#
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=300000       #HISTSIZE= HISTFILESIZE=
#HISTFILESIZE=30000    #for infinite history
HISTSIZE= HISTFILESIZE=

#history file location
HISTFILE=~/.cache/bash/history
#---------------------------------------------------------------#


#---------------------------------------------------------------#
						#COLOR
#---------------------------------------------------------------#
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    
     PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; 
     		then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; 
     		else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; 
     		fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"

    ;;
*)
    ;;
esac
#---------------------------------------------------------------#


# #---------------------------------------------------------------#
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
# above can also be written as
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
# #---------------------------------------------------------------#





#---------------------------------------------------------------#
# 						FOR JAVA
#---------------------------------------------------------------#
export JAVA_HOME=/usr/lib/jvm/java-13-openjdk
export PATH=$JAVA_HOME/bin:$PATH

#                       FOR .NET
export DOTNET_ROOT=/opt/dotnet


#---------------------------------------------------------------#

export PATH="${PATH}:${HOME}/.local/bin/"