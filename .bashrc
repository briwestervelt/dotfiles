
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

C_BLK='\[\033[30m\]' ; C_RED='\[\033[31m\]' ; C_GRN='\[\033[32m\]'
C_YLW='\[\033[33m\]' ; C_BLU='\[\033[34m\]' ; C_PRP='\[\033[35m\]'
C_CYN='\[\033[36m\]' ; C_WHT='\[\033[37m\]' ; C_END='\[\033[00m\]'
PS1="${C_GRN}\u@\h${C_END} ${C_YLW}\w${C_END} "

export PATH="$PATH:$HOME/scripts"

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias lla='ls -la'
alias lll='ls -ltr'
alias llla='ls -ltra'
alias vim='nvim'

alias ":e"="vim"
alias ":q"="exit"

alias writer="libreoffice --writer"
alias calc="libreoffice --calc"
alias word="writer"
alias excel="calc"

alias dothething='clear ; printf "\n\n" ; neofetch --memory_unit gib ; echo'

alias pac_list_all='pacman -Q'
alias pac_list_unused='pacman -Qqtd'
alias pac_remove_unused='pacman -Qqtd | sudo pacman -Rns -'

