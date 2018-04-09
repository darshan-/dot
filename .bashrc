# These lines are from .gentoo-system-bashrc, but assume color is supported, since the test broke on
#  20161219 early-AM upgrade.  There may be circumstances when this is bad (ssh in from somewhere without
#  color support?)
PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'


export HISTSIZE=99999
export HISTFILESIZE=99999
export HISTCONTROL=ignoreboth
export RI="--format ansi"
export LESS="-R -M"
export EDITOR=emacs

export MAKEFLAGS="-j12"

export GOPATH=~/go/gopath

export ANDROID_HOME=/opt/android-sdk

export CLOUDSDK_PYTHON=/usr/bin/python2.7

# For emacs (and maybe others) warning:
#  ** (emacs:17298): WARNING **: Couldn't register with accessibility bus: Did not receive a reply. ...
export NO_AT_BRIDGE=1

export PATH=$PATH:/opt/calibre:~/software/google-cloud-sdk/bin:~/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$(ruby -e "puts Gem.user_dir")/bin:~/node_modules/firebase/bin

function ok() {
  okular "$*" 2>/dev/null &
  return 0
}

alias  bi="cd ~/src/android/BI_on_googlecode.com/default"
alias rmbk="rm *~ .*~ 2>/dev/null"
export VDPAU_DRIVER=va_gl
#source /usr/share/nvm/init-nvm.sh
