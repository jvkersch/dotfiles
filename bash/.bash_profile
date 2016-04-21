#! /bin/bash

[[ -f ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

# OPAM configuration
. /Users/jvkersch/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
