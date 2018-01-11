#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la --color=auto'

alias c='clear'

PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
# <<< END ADDED BY CNCHI INSTALLER

# added by Anaconda3 4.3.1 installer
export PATH="/home/stefan/anaconda3/bin:$PATH"

# added by Anaconda3 4.4.0 installer
export PATH="/home/stefan/Software/anaconda3/bin:$PATH"

# aliases for tools
alias swstm32='~/Software/SystemWorkbench/eclipse&'
alias octave='octave --no-gui'
