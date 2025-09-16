# r-cha's dotfiles

I use [chezmoi](https://www.chezmoi.io/) to manage my dotfiles across machines.

# Requirements

Chezmoi doesn't handle system state, only config files.

A number of tools are configured by this repo, but only the following are actively maintained:

- zsh
- git
- ghostty
- neovim

## Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply r-cha
brew install --cask ghostty
brew install neovim
brew install font-iosevka-term
```

