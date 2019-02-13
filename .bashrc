# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Edit Tom's Crontab on HT servers
alias toms_crontab="sudo -u tburtonw crontab -e"


# EDITOR
export EDITOR="emacs"
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

    # Forward on the TERM variable
    LC_TERM=$TERM_PROGRAM
fi



# JAVA

if [ "$(uname)" == "Darwin" ]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi


# basic utils
alias ls='/bin/ls -GFh'
alias ll='/bin/ls -Flhrt'

alias l=""
alias df='df -h'
alias top='/usr/bin/top -o cpu -R'

# Better file viewing

export LESSBIN="$(find /usr/share/vim/ -name less.sh | tail -1)"


function x() {
    tidy -i -xml $1 | $LESSBIN
}

function j() {
    cat $1 | json_pp | $LESSBIN
}

function less() {
    if `echo $1 | grep -q '\.xml'`; then
	x $1
    elif `echo $1 | grep -q '\.json'`; then
	j $1
    else
	$LESSBIN $1
    fi
}




# SSHFS

# Run minitest tests by regexp
function runtest() {
  file=$1
  args=$2
  ruby -Itest -Ispec -Ilib $1 -n "/${2}/" $3
}

alias runtests=runtest



#### Utils ###

function chrome() {
   open -a "Google Chrome" "$1"
}


# SSHFS

function mnt_alias() {
  mkdir /Volumes/$1
  sshfs "$3@$2:/$4" /Volumes/"$1" -oauto_cache,idmap=user,volname="$1"
}

# A simple set of defaults for mnt
# $1 machinename under .umdl.umich.edu
# $2 path
# We assume dueberb, and that the /Volumes directory is the same as $1

function mnt() {
  mnt_alias $1 "$1.umdl.umich.edu" "dueberb" $2
}

function mnt_htapps() {
  mnt_alias htapps punch.umdl.umich.edu dueberb /htapps
}

# HOMEBREW
export PATH=$HOME/bin:/usr/local/brew/bin:$PATH
alias brewski='brew update && brew upgrade && brew upgrade brew-cask; brew cleanup; brew cask cleanup; brew doctor'

# RUBY


alias bx='bundle exec'


# git
alias tags="git for-each-ref refs/tags --sort=authordate --format='%(refname:short)'"
#test -f ~/.git-completion.bash && . $_


source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash




