# Path: ~/.bash_profile
# Purpose: Default bash config file at user login
# Updated on: 22-10-2024

# NOTE: Add below to .bashrc instead of .bash_profile if bash is not the default shell at login (like in mac)

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        source ~/.bashrc
fi
if [ -f ~/.bash_aliases ]; then
        source ~/.bash_aliases
fi
