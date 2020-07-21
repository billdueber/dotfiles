# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Edit Tom's Crontab on HT servers
alias toms_crontab="sudo -u tburtonw crontab -e"
alias my="mysql -h mysql-sdr -p ht"

# SDR locations
export SDRROOT=/htapps/babel
export SDRDATAROOT=/sdr1

function exists () {
 command -v $1 >/dev/null 2>&1
}

if exists emacs; then
  export EDITOR="emacs"
elif exists jove; then
 export EDITOR="jove"
else
  export EDITOR="nano"
fi

# EDITOR
alias emacs=$EDITOR
export VISUAL=$EDITOR


# AFs
alias afs="kinit;aklog"

# Check for brew to see if we're on one of my machines or
# on a server and behave accordingly

if [ -d /usr/local/brew ]; then
    MyMachine='true'
else
    MyMachine='false'
fi

if [ $MyMachine == 'true' ]; then
    source /usr/local/brew/etc/bash_completion
    ### Brew paths for openssl
    export LD_LIBRARY_PATH=/usr/local/brew/opt/openssl/lib:"${LD_LIBRARY_PATH}"
    export CPATH=/usr/local/brew/opt/openssl/include:"${CPATH}"
fi


# basic utils

if [ -f /usr/local/brew/bin/exa ]; then
  alias ls='exa -Fh'
  alias ll='ls -F -l -h -r -snew '
else
  alias ls='/bin/ls -GFh'
  alias ll="/bin/ls -lhrt"
fi


alias df='df -H'
alias top='/usr/bin/top -o cpu -R'

# Better file viewing

alias less=bat

#### Utils ###

function chrome() {
   open -a "Google Chrome" "$1"
}


# PATH
export PATH=$HOME/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:/usr/local/brew/bin:$PATH
alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'

# RUBY

alias bx='bundle exec'
RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`


[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash

[ -f /usr/local/brew/etc/bash_completion.d ] && source /usr/local/brew/etc/bash_completion.d 

eval "$(/usr/local/brew/bin/starship init bash)"
eval "$(jump shell bash)"



