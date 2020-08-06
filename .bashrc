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

export TERM=xterm-256color

# For global yarn modules
export PATH="/home/stefan/.yarn/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/stefan/Software/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/stefan/Software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/stefan/Software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/stefan/Software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

