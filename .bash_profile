if [ -f /etc/profile ]; then
  . /etc/profile
fi


test -e ".bashrc" && source "${HOME}/.bashrc"

if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  test -e ".iterm2_shell_integration.bash" && source ".iterm2_shell_integration.bash" 
  test -e ".iterm2_mystuff" && source ".iterm2_mystuff"
fi









