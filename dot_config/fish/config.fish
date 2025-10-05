source ~/.config/fish/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

# Start keychain for ssh keys
if type -q keychain
    keychain -q id_ed25519
    source (keychain -q --eval id_ed25519 | psub)
end

if type -q nvim
  set -gx EDITOR nvim
else
  set -gx EDITOR vim
end

if type -q zeditor
  set -gx VISUAL zeditor
end

# Trash-cli https://github.com/andreafrancia/trash-cli
if status is-interactive
  alias rm='echo "This is not the command you are looking for. Use \'th\' instead. To use rm append a \'\\\' "; false'
end
alias th="trash-put"

# Add .local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

alias z="zoxide"
zoxide init fish | source

# Tmux-Zoxide-Sessionizer
set -gx _ZO_FZF_OPTS "--height=100%"
bind ctrl-f 'tz'
