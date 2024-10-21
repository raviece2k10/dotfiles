# Path: ~/.bash_aliases
# Purpose: Aliases file for bash
# Updated on: 21-10-2024

# Function to add user defined aliases easily
add_alias() {
    echo "alias $1='$2'" >> ~/.bash_aliases
    source ~/.bash_aliases  # Reload .bash_aliases to make the alias effective immediately
}

## ls
alias ll='ls -l'
alias la='ls -A'
alias lf='ls -CF'
alias lg='ls -A | grep'

## pssh  
if parallel-ssh --version >/dev/null 2>&1; then
    alias pssh='parallel-ssh'
    alias pscp='parallel-scp'
    alias prsync='parallel-rsync'
    alias pslurp='parallel-slurp'
    alias prscp='parallel-slurp'
elif pssh --version >/dev/null 2>&1; then
    echo -e "\n# Info: Updated pssh installed, basic aliases not required.
        Run [ls /usr/bin | grep -iE 'pssh|prsync|pscp|pslurp'] for list of installed pssh tools."
else
    echo -e "\n# Error: pssh or parallel-ssh not present in '/usr/bin'. Kindly check installation path and --version."
fi
alias psshx='pssh -x "-q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o LogLevel=ERROR"'

## fzf
ff() {
    choice="$1"
    case "$choice" in
        "-d")
            ls -A "$2" | fzf  --preview 'cat {}'
            ;;
        "-f")
            cat "$2" | fzf
            ;;
        "ps")
            ps axo pid,rss,comm --no-headers | fzf --preview 'ps o args {1}; ps mu {1}'
            ;;
        "git")
            git log --oneline | fzf --preview 'git show --name-only {1}'
            ;;
        "apt")
            apt-cache search . | fzf --preview 'apt-cache depends {1}'
            ;;
          *)
            ls -A ~ | fzf  --preview 'cat {}'
            ;;
    esac
# More functions to be added to open/preview files/dir.
}