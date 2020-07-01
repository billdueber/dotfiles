# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Edit Tom's Crontab on HT servers
alias toms_crontab="sudo -u tburtonw crontab -e"

# Login to servers
alias 001="slogin macc-ht-ingest-001"
alias b1="slogin beeftea-1"
alias b2="slogin beeftea-2"
alias grog="slogin grog"

alias myrw="mysql -h mysql-sdr -p ht"
alias my="mysql -h mysql-sdr-ro -p ht"

# SDR locations
export SDRROOT=/htapps/babel
export SDRDATAROOT=/sdr1

# PATH
export PATH=$HOME/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:/usr/local/brew/bin:$PATH
alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'


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

if exists exa ; then
  alias ls='exa -Fh'
  alias ll='ls -F -l -h -r -snew '
else
  alias ls='/bin/ls -GFh'
  alias ll="/bin/ls -lhrt"
fi


alias df='df -H'
alias top='/usr/bin/top -o cpu -R'

# Better file viewing

if exists bat; then
  alias less=bat
fi


#### Utils ###

function chrome() {
   open -a "Google Chrome" "$1"
}

# RUBY

alias bx='bundle exec'
RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline`

# git
alias tags="git tag -n1 -l --sort=taggerdate"

[ -f $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
[ -f $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash
[ -f /usr/local/brew/etc/bash_completion.d ] && source /usr/local/brew/etc/bash_completion.d 

if exists starship; then
  ss=`command -v starship`
  source <("$ss" init bash --print-full-init)
fi

if exists jump; then
  eval "$(jump shell bash)"
  alias j=jump
fi





