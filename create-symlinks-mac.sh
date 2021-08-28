#!/bin/bash

set -e pipefail

for f in emacs.org init.el; do
    ln -s "$PWD/roles/emacs/tasks/dot-emacs.d/$f" ~/.emacs.d/
done

