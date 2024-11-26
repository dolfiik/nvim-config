# Nvim configuration

This repo contains my neovim config files, mostly copied from [kickstart](https://github.com/nvim-lua/kickstart.nvim) but I changed the way files are organized and added some other things.
Lsp is mostly ai generated since I had no clue how to properly set it up even with kickstart and other sources

Feel absolutely free to suggest any changes, improvements or generally speaking point out areas of development this config lacks support in (probably testing lol)

## Installation

Just clone it 4head
Before cloning make sure the directory `~/.config/nvim` does not already exist or is empty, as "git clone" will create a new directory with the repository name if it doesn't exist.

```bash
git clone https://github.com/dolfiik/nvim-config.git ~/.config/nvim
```

Make sure to clone it into the `~/.config/nvim` directory
Path:
- for linux: $XDG_CONFIG_HOMW/nvim
- for mac: ~/.config/nvim
- windows cmd: %localappdata%\nvim\
- windows powershell: $env:LOCALAPPDATA\nvim\

Really do make sure you're in the right directory otherwise it won't work
