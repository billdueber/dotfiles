if [ -f /etc/profile ]; then
  . /etc/profile
fi


function itermify() {
  [ ! -z $TERM ] && test -e ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  [ ! -z $TERM ] &&  test -e ".iterm2_mystuff" && source ".iterm2_mystuff"
}

test -f ".bashrc" && source "${HOME}/.bashrc"


# Can't pass along env variable; just always load it and hope for the best
#if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  test -f ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  test -f ".iterm2_mystuff" && source ".iterm2_mystuff"
#fi

if [[ $LC_TERM == 'iTerm.app' ]]; then
  test -f "${HOME}/.iterm2_mystuff" && source "${HOME}/.iterm2_mystuff"
fi

itermify








