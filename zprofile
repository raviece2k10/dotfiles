# Path: ~/.zprofile
# Purpose: Default zsh config file at user login (from my mac)
# Updated on: 21-10-2024

eval "$(/opt/homebrew/bin/brew shellenv)"

JAVA_HOME=/usr/libexec/java_home
export JAVA_HOME;

##----------------- My data -----------------##

# Open URL in Google Chrome
chrome() {
  open -a "Google Chrome" "$1"
}

# Ping & resolve domain name of node and their console
node() {
  "$1" "$2""$3".englab.juniper.net
}

alias nping='node "ping"'
alias nlookup='node "nslookup"'

# SSH login to node
nssh() {
  ssh root@"$1""$2".englab.juniper.net
}

# Open node console URL in Google Chrome
nconsole() {
  open -a "Google Chrome" http://"$1"-con.englab.juniper.net
}

nipmi() {
  open -a "Google Chrome" http://"$1"-ipmi.englab.juniper.net
}

#---Not Working---#

# Login to node via LRM Web-Terminal [not working]
nwssh() {
        open -a "Google Chrome" https://inception.juniper.net/lrm/web-terminal/connect?hostname="$1".englab.juniper.net
}

# Open node kvm console in Google Chrome [not working]
nkvmcon() {
  open -a "Google Chrome" http://"$1"-con.englab.juniper.net/cgi/url_redirect.cgi?url_name=man_ikvm_html5_bootstrap
}

#---- My Mac scripts alias ----#

alias check-node='./Downloads/mac_scripts/check-node.sh'