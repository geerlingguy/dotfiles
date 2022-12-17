#
# .zshrc
#
# @author Ryan McNulty
#

# Path to oh-my-zsh installation.
export ZSH="/Users/ryan/.oh-my-zsh"

# Custom alias
alias pi="ssh pi"
alias piz="ssh piz"
alias dd="~/Developer"
alias backup-ssh="zip -er /Volumes/Ryan/Home\ Network\ Things/ssh_dir_personal_mac.zip /Users/ryan/.ssh/"
alias pidate="ansible-playbook -i ~/Developer/ansible/playbooks/inventory.cfg -u pi ~/Developer/ansible/playbooks/system-base-config.yml"
alias reload="source ~/.zshrc"
alias brewu="brew update && brew upgrade"

# Custom functions
function rawtidyup(){
for x in *.CR2
do
    [ -e "${x%.CR2}.jpg" ] || rm "$x"
done
}

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"
