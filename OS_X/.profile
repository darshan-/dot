source '.private-profile'

export EDITOR=emacs
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

alias ls='ls -G'

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
