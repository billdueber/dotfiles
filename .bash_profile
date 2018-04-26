if [ -f /etc/profile ]; then
  . /etc/profile
fi


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" 
test -e "${HOME}/.bashrc" && source "${HOME}/.bashrc"

if [[ $TERM_PROGRAM == 'iTerm.app' ]]; then
  test -e "${HOME}/.iterm2_mystuff" && source "${HOME}/.iterm2_mystuff"
fi









