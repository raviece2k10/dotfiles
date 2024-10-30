# ~/.zshrc
# Last Updated: 22-10-2024

# Added by iterm2 app
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# Added by fzf pkg
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Function to add user defined aliases easily
add_alias() {
    echo "alias $1='$2'" >> ~/.zshrc
    source ~/.zshrc     # Reload .zshrc file to make the alias effective immediately
}

# User defined aliases
