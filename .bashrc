source ~/.gentoo-system-bashrc
source ~/.bashrc-private

export HISTSIZE=99999
export HISTFILESIZE=99999
export HISTCONTROL=ignoreboth
export RI="--format ansi"

#export GOROOT=~/software/go/
#export GOPATH=~/src/go

export GOPATH=~/go/gopath

export ANDROID_HOME=/opt/android-sdk
export ANDROID_SWT=/usr/share/java

export PATH=$PATH:~/bin:/home/darshan/software/jruby-1.5.6/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/home/darshan/software/dmd2/linux/bin64:/opt/wine-compholio/bin

#:$GOROOT/bin

export ANDROID_JAVA_HOME=/opt/sun-jdk-1.6.0.26/

#unset RUBYOPT

export EIX_LIMIT=0

## This loads RVM into a shell session.
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function wn() {
  if [ "X" = "X$1" ]; then
    echo "Usage: wn <window name>"
    return 1
  fi

  NAME="$*"
  export PROMPT_COMMAND='echo -ne "\033]0;$NAME\007"'
  return 0
}

function wnd() {
  export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
  return 0
}

function ok() {
  okular "$*" 2>/dev/null &
  return 0
}

function lo() {
  libreoffice "$*" 2>/dev/null &
  return 0
}

# TODO: make it accept piped data somehow?
function emacs-as-pager() {
  FILE="$*"
  emacs -nw --eval "(global-set-key (kbd \"q\") 'kill-emacs)" \
            --eval "(global-set-key (kbd \"/\") 'isearch-forward)" \
            --eval "(find-file-read-only \"$FILE\")"
  return 0
}

function pdfla() {
  for texfile in *.tex
  do
    pdflatex -interaction batchmode "$texfile" >/dev/null
  done
}

alias wr="cd ~/ged-home/Desktop/Writing/"
alias sc="cd ~/ged-home/Desktop/Writing/School/"

alias  bi="cd ~/src/android/BI_on_googlecode.com/default"
alias  ah="cd ~/src/app-engine/amalgamandhealth.com"
alias svt="cd ~/src/android/spanish-vocabulary-trainer/"

alias 243="sc; cd MTH243; wn MTH243"
alias 244="sc; cd MTH244; wn MTH244"
alias 252="sc; cd MTH252; wn MTH252"
alias 253="sc; cd MTH253; wn MTH253"
alias spa="sc; cd SPA203; wn SPA203"

alias and="cd ~/src/android-4.0.1/frameworks/base/core/java/android"

alias esync="sudo emerge --sync; eix-update"

alias rmbk="rm *~ .*~ 2>/dev/null"

#alias  les=`which less`
#alias less="emacs-as-pager"

alias dump-klipper="dbus-send --print-reply --dest=org.kde.klipper /klipper org.kde.klipper.klipper.getClipboardHistoryMenu"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
