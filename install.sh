#!/bin/sh

set -e

# Requires my tweaked version of Stow
for proj in amethyst bash emacs; do
    stow --dotfiles --no-folding $proj
done
