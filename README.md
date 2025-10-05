<details><summary id="dependencies">My Packages</summary>
  
  - base-devel
  - greetd
  - greetd-tuigreet
  - mason
  - cpio
  - neovim
  - fzf
  - chezmoi
  - uwsm
  - gnome-keyring
  - polkit-gnome
  - seahorse
  - mpv
  - alacritty
  - btop
  - file-roller
  - kate
  - tealdeer
  - trash-cli
  - obsidian
  - uv
  - lazygit
  - thunar
  - thunar-archive-plugin
  - thunar-shares-plugin
  - gvfs
  - gvfs-smb
  - tmux
  - youtube-music
  - plexamp
  - stremio
  - zed
  - zoxide
  - qt5ct
  - qt6ct
  - kvantum
  - breeze-icons
  - adw-gtk-theme
  - qimgv-git

Pacman
```bash
sudo pacman -S --needed base-devel greetd greetd-tuigreet mason cpio neovim fzf chezmoi uwsm gnome-keyring polkit-gnome seahorse mpv alacritty btop file-roller kate tealdeer trash-cli obsidian uv lazygit thunar thunar-archive-plugin gvfs tmux zed zoxide qt5ct qt6ct kvantum breeze-icons adw-gtk-theme
```

AUR
```bash
paru -S --needed youtube-music plexamp-appimage stremio qimgv-git`
```

</details>

## Update config
```
chezmoi update
```

## How to add to new system
### Package manager (recommended)
Install chezmoi info here: [Chezmoi Install](https://www.chezmoi.io/install/)

Then run this command to initialize:
```
chezmoi init https://github.com/isaaki/dotfiles.git
```

Check the diffrence:
```
chezmoi diff
```

Finaly apply config:
```
chezmoi apply --verbose
```

### One-line binary
Have curl installed
Then use this one line command:
```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply isaaki
```

### SSH
Start the ssh-agent with
```
eval "$(ssh-agent -s)"
```
Then add key to ssh-agent with
```
ssh-add ~/.ssh/id_ed25519
```

On windows follow this [Github docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=windows#adding-your-ssh-key-to-the-ssh-agent)
