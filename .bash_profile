if [ -f /etc/profile ]; then
  . /etc/profile
fi


function itermify() {
  [ ! -z $TERM ] && test -e ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  [ ! -z $TERM ] &&  test -e ".iterm2_mystuff" && source ".iterm2_mystuff"
}

test -f ".bashrc" && source "${HOME}/.bashrc"


itermify








