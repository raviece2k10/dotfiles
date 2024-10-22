# ~/.zprofile (from mac)
# Purpose: Default zsh config file at user login 
# Updated on: 22-10-2024

## For Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
## For Java
JAVA_HOME=/usr/libexec/java_home
export JAVA_HOME;
## For Nodejs
# if ! node -v >/dev/null 2>&1; then
#     node_ver="22.10.0"
#     NODE="/opt/homebrew/Cellar/node/{$node_ver}/bin"
#     export PATH="$PATH:$NODE"
# fi

## Get aliases and functions from zshrc file
if [ -f ~/.zshrc ]; then
        source ~/.zshrc
fi