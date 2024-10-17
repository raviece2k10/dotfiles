# Path: ~/.bash_aliases
# Purpose: defining aliases for bashrc file
# Updated on: 16-10-2024

# Function to add user defined aliases easily
add_alias() {
    echo "alias $1='$2'" >> ~/.bash_aliases
    source ~/.bash_aliases  # Reload .bash_aliases to make the alias effective immediately
}

# ls
alias ll='ls -l'
alias la='ls -A'
alias lf='ls -CF'
alias lg='ls -A | grep'

# pssh
alias pssh='parallel-ssh'
alias mpssh='parallel-ssh -i -x "-q -o StrictHostKeyChecking=no -o ConnectTimeout=10 -o LogLevel=ERROR"'
alias pscp='parallel-scp'
alias prsync='parallel-rsync'
alias pslurp='parallel-slurp'
alias prscp='parallel-slurp'

# fzf
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
}