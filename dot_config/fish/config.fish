source ~/.config/fish/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

set -gx EDITOR nvim
set -gx VISUAL zeditor

# Trash-cli https://github.com/andreafrancia/trash-cli
alias rm='echo "This is not the command you are looking for. Use \'th\' instead. To use rm append a \'\\\' "; false'
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
