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

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/stefan/Software/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/stefan/Software/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/stefan/Software/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/stefan/Software/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export TERM=xterm-256color
