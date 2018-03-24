# File: ~/bashrc_arch
# Author: Oliver Michels <oliver.michels@gmx.net>
# Desc: Configuration of the bash for non-login shells on Arch Linux

#.bashrc
if [[ $- != *i* ]] ; then
# Shell is non-interactive. Be done now!
return
fi

complete -cf sudo # Tab complete for sudo

# shopt options
shopt -s cdspell # This will correct minor spelling errors in a cd command.
shopt -s histappend # Append to history rather than overwrite
shopt -s checkwinsize # Check window after each command
shopt -s dotglob # files beginning with . to be returned in the results of path-name expansion.

# set options
set -o noclobber # prevent overwriting files with cat

# Prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;31m\]\[\e[m\]\[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\]'

# X Terminal titles
case "$TERM" in
xterm*|rxvt*)
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
;;
*)
;;
esac

alias ls='ls -la --color=auto'
alias c='clear'

# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
# <<< END ADDED BY CNCHI INSTALLER

# added by Anaconda3 4.3.1 installer
export PATH="/home/stefan/anaconda3/bin:$PATH"

# added by Anaconda3 4.4.0 installer
export PATH="/home/stefan/Software/anaconda3/bin:$PATH"

# add matlab to path
export PATH="/home/stefan/Software/MATLAB/R2017a/bin:$PATH"

# aliases for tools
alias swstm32='~/Software/SystemWorkbench/eclipse&'
alias octave='octave --no-gui'
