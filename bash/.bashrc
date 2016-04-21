#!/bin/bash

export GOPATH="$HOME/projects/go"

PATH="/usr/local/bin:/usr/local/opt/ruby/bin:$PATH:/Users/jvkersch/local/bin"
PATH="/usr/local/sbin:$PATH"
PATH="/Users/jvkersch/.cask/bin:$PATH"
PATH="$PATH:$GOPATH/bin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"
export PATH="$PATH"

# Store a record of where we were before changing directory.
function cd() { export PREVIOUS=$(pwd) && builtin cd "$@"; }

# Unlimited history + timestamps
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%h/%d %H:%M:%S "

# Aliases
alias ec=emacsclient
alias ls="ls -G"
alias peekd="dirs +1"

alias gbs="git bisect start"
alias gbb="git bisect bad"
alias gbg="git bisect good"
alias gbr="git bisect reset"

export EDITOR=emacsclient

# Specific programming environments

canopy() { . ~/Library/Enthought/Canopy_64bit/User/bin/activate; }
my_ocaml() { . /Users/jvkersch/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true; }

function my_java() {
    JUNIT_HOME="$HOME/local/junit"
    export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit.jar:$JUNIT_HOME/hamcrest.jar"
    export SBT_OPTS="-XX:MaxPermSize=256m"
}

# Don't check docstrings, pyflakes.
export PYFLAKES_NODOCTEST=1

# Setup for virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=~/.environments
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

# Autocomplete for Google cloud SDK
gcloud_sdk_path=${HOME}/google-cloud-sdk
for i in {path,completion}.bash.inc; do
    [[ -f ${gcloud_sdk_path}/${i} ]] && . ${gcloud_sdk_path}/${i}
done

# SSH autocomplete
_ssh_comp() {
    perl -ne 'print "$1 " if /^Host (.+)$/' ~/.ssh/config
}
complete -W "$(_ssh_comp)" ssh

# Git setup.
[[ -f ~/local/etc/git-completion.bash ]] && . ~/local/etc/git-completion.bash
[[ -f ~/local/etc/git-prompt.sh ]] && .  ~/local/etc/git-prompt.sh

# Fix horrible colors below.
export PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u \[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\n\[$WHITE\]\$ "

# Manage SSH keys via keychain script
rekeychain() { eval $(keychain --eval --quiet -Q --agents ssh --inherit any id_rsa id_rsa_primary) ; ssh-add -l; }
rekeychain

# Set up pyenv
eval "$(pyenv init -)"
