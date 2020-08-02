# Path management

set PATH $PATH ~/.cask/bin
set PATH $PATH ~/edm/bin

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
    ssh-add ~/.ssh/id_ecdsa_linux_2017
end
