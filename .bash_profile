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

# Include alias files for easier ssh and remote connections (private).
source ~/.bash_aliases

# Route local traffic over ethernet when using certain WiFi networks w/o proxy.
function net_route() {
  sudo route add -net 10.0.0.0/8 -interface en3
}

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Turn on Git autocomplete.
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
