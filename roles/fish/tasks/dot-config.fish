# Path management

# SETUVAR fish_user_paths:/home/jvankerschaver/local/miniconda3/bin/

set -Ua user_paths_appended ~/.cask/bin


# Key management

if status --is-interactive
    keychain --quiet --agents ssh
end

begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
end

function addkeys
    ssh-add ~/.ssh/id_rsa
    ssh-add ~/.ssh/id_rsa_2016
end

# Convenient aliases
alias R="edm run -- "
alias P="edm run -e ls-platform -- "

# Start emacs
alias start_emacs="~/local/bin/emacs-26.3 &; disown"
alias ec=emacsclient

#
alias start_dell="xrandr --output DP-4 --scale 2x2 --mode 2560x1440 --fb 5120x5040 --pos 0x0 --output eDP-1-1 --scale 1x1 --pos 640x2880"

# Calibre books management
function sync-books
    set -l calibre-server "pi@192.168.0.100"
    set -l books-folder "$HOME/Books"
    # Synchronize with local calibre-web install
    unison $books-folder ssh://{$calibre-server}/Books
    # Restart server
    ssh $calibre-server 'cd dockerfiles/calibre-web && docker-compose restart'
end
