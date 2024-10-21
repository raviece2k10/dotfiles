#!/bin/bash
# Purpose: Getting custom dev environment ready in the current dir (modify as per your requirement) 
# Updated By: Ravi Kr Singh
# Updated On: 21-10-2024

echo
echo "## Getting dev environment ready for [$(hostname)] ..."

# Installing git if not available
if ! git --version >/dev/null 2>&1; then
    echo "#ERROR: git not found, installing git ..."
    sudo apt install git -y || sudo yum install git -y
    git --version
fi

# Function for cloning or pulling from git
git_clone() {
    repo_dir=$(echo "$1" | cut -d/ -f5 | cut -d. -f1) 
    if [ -d "$repo_dir" ]; then
        cd "$repo_dir"
        git pull origin $2
        cd ..
    else
        git clone $1 -b $2
    fi
}

# Fetch Git repos
echo
read -p "## Fetch git repos [y or n]: " git_input
if [ "$git_input" == "y" ]; then
    # git_clone "https://github.com/raviece2k10/contrail.git" "main"
    # git_clone "https://ssd-git.juniper.net/contrail/contrail-tools.git" "ravi"
    git_clone "https://github.com/raviece2k10/dotfiles.git" "main"
    git_clone "https://github.com/raviece2k10/Projects.git" "main"
else 
    echo "# WARNING: Not fetching git repos. Updated files may not be available."
fi
echo

# Update dotfiles
read -p "## Update dotfiles (.vimrc, .bashrc etc.) [y or n]: " dotfiles_input
if [ "$dotfiles_input" == "y" ]; then
    # copying dotfiles from git dir to local system
    cp dotfiles/vimrc ~/.vimrc
    cp dotfiles/bashrc ~/.bashrc
    cp dotfiles/bash_aliases ~/.bash_aliases
else
    echo "# WARNING: Dotfiles not updated, some functions or cmds may not work."
fi
echo

# Get all Tools
read -p "## Install/Update all tools (vim,fzf etc.) [y or n]: " tools_input
if [ "$tools_input" == "y" ]; then
    # installing vim
    if ! vim --version >/dev/null 2>&1; then
        sudo apt install vim -y || sudo yum install vim -y
    fi
    # installing vim-plug
    if [ ! -f "~/.vim/autoload/plug.vim" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    # installing fzf
    if ! fzf --version >/dev/null 2>&1; then
        if ! -f ~/.fzf; then
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install
        else
            ~/.fzf/install
        fi
    fi
else
    echo "# WARNING: Recommended tools not installed, productivity might decrease."
fi
echo

echo "# Success: Almost done. 

# Last step is to enable vim plugins:
> Open vim and type below command to install plugins.
:PlugInstall<CR>
> Close and re-open the vim for changes to take effect.

# Check the tools version: 
vim --version (should be greater than 8.0 for plugins to work)
fzf --version
> if any error, run 'source ~/.bashrc' manually and try again.
> Also, modify ~/.bash_profile to load the config automatically at login.
"
sleep 3
if [ -f "~/.bash_profile" ]; then
    source ~/.bash_profile
fi
if [ -f "~/.bashrc" ]; then
    source ~/.bashrc
fi
