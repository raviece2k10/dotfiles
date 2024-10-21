# Path: ~/.bash_profile
# Purpose: Default bash profile at user login
# Updated on: 21-10-2024

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi
if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
fi

# User specific environment and startup programs
PATH="$PATH:$HOME/bin:/root/ravi-tools/bin"
export PATH
