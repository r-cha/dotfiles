# r-cha's dotfiles

I use [chezmoi](https://www.chezmoi.io/) to manage my dotfiles across machines.

# Requirements

Chezmoi doesn't handle system state, only config files.
The following are configured by this repo:

- zsh
- git
- kitty
- neovim

To fully comply with the configuration, the following are also expected to be available on the system:

- [Iosevka Term](https://typeof.net/Iosevka/)

## Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply r-cha
brew install font-iosevka-term
```

