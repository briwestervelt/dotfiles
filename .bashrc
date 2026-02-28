
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

P_GREEN='\[\033[0;32m\]'
P_YELLOW='\[\033[0;33m\]'
P_END='\[\033[0m\]'
export PS1="${P_GREEN}\u@\h${P_END} ${P_YELLOW}\w${P_END} "
unset P_GREEN P_YELLOW P_END

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

