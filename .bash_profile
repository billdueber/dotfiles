if [ -f /etc/profile ]; then
  . /etc/profile
fi


function itermify() {
  test -e ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  test -e ".iterm2_mystuff" && source ".iterm2_mystuff"
}

test -e ".bashrc" && source "${HOME}/.bashrc"


# Can't pass along env variable; just always load it and hope for the best
#if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  test -e ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  test -e ".iterm2_mystuff" && source ".iterm2_mystuff"
#fi

if [[ $LC_TERM == 'iTerm.app' ]]; then
  test -e "${HOME}/.iterm2_mystuff" && source "${HOME}/.iterm2_mystuff"
fi









