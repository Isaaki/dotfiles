## Update config
Just use ```chezmoi update```

## How to add to new system
### Package manager (recommended)
Install chezmoi info here: [Chezmoi Install](https://www.chezmoi.io/install/)

Then run this command to initialize ```chezmoi init https://github.com/isaaki/dotfiles.git```

Check the diffrence ```chezmoi diff```

Finaly apply config ```chezmoi apply --verbose```

### One-line binary
Have curl installed
Then use this one line command `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply isaaki`
