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
export PATH=/usr/local/bin:/Users/jgeerling/bin:/usr/local/sbin:/usr/local/git/bin:/Developer/Eclipse/android-sdk-macosx/platform-tools:/Developer/Eclipse/android-sdk-macosx/tools:$PATH

# Flush DNS cache (See: http://support.apple.com/kb/ht5343).
alias flush-dns='sudo killall -HUP mDNSResponder'

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Route local traffic over ethernet when using certain WiFi networks w/o proxy.
function route_add() {
  sudo route add -net 10.0.0.0/8 -interface en0
}

# Delete the route added above.
function route_delete() {
  sudo route delete 10.0.0.0
}

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gsd='git svn dcommit'
alias gsfr='git svn fetch && git svn rebase'

# Turn on Git autocomplete.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Disable cowsay in Ansible.
export ANSIBLE_NOCOWS=1

# Ansible aliases.
alias an='ansible'
alias ap='ansible-playbook'
