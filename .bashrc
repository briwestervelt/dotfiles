
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\e[0;32m\u@\h\e[m \e[0;33m\w\e[m "

export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/.local/bin"

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -hl'
alias lla='ls -hla'
alias lll='ls -hltr'
alias llla='ls -hltra'
alias vim='nvim'

alias ":e"="vim"
alias ":q"="exit"

