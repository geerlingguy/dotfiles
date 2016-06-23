#
# .bash_profile
#
# @author Jeff Geerling
# @see .inputrc
#

# Nicer prompt.
export PS1=" \D{%I:%M %p}:\w $ "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$HOME/.composer/vendor/bin:$PATH

# Flush DNS cache (See: http://support.apple.com/kb/ht5343).
alias flush-dns='sudo killall -HUP mDNSResponder'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Route local traffic over ethernet when using certain WiFi networks w/o proxy.
function route_add() {
  sudo route add -net 10.0.0.0/8 -interface en0
}

# Delete the route added above.
function route_delete() {
  sudo route delete 10.0.0.0
}

# Route IRC traffic through one of my servers.
# Use SOCKS5 settings 'localhost' and 6667 for server/port.
function irc_proxy() {
  ssh -vD 6667 geerlingguy@atl1.servercheck.in
}

# Syntax-highlight code for copying and pasting.
# Requires highlight (`brew install highlight`).
function pretty() {
  pbpaste | highlight --syntax=$1 -O rtf | pbcopy
}

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gsd='git svn dcommit'
alias gsfr='git svn fetch && git svn rebase'

# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# Use brew-installed PHP binaries.
export PATH="$brew_prefix/opt/php56/bin:$PATH"

# Vagrant configuration.
# export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Disable cowsay in Ansible.
export ANSIBLE_NOCOWS=1

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: line number missing" >&2;
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}

# Ask for confirmation when 'prod' is in a command string.
prod_command_trap () {
  if [[ $BASH_COMMAND == *prod* ]]
  then
    read -p "Are you sure you want to run this command on prod [Y/n]? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo -e "\nRunning command \"$BASH_COMMAND\" \n"
    else
      echo -e "\nCommand was not run.\n"
      return 1
    fi
  fi
}
shopt -s extdebug
trap prod_command_trap DEBUG
