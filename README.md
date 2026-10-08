# r-cha's dotfiles

I use [chezmoi](https://www.chezmoi.io/) to manage my dotfiles across machines.

A number of tools are configured by this repo, but only the following are actively maintained:

- zsh
- git
- ghostty
- neovim

## Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply r-cha
```

On macOS, `init --apply` installs Homebrew if it's missing and then runs `brew bundle` against [`Brewfile`](Brewfile). The script runs again whenever `Brewfile` changes.

To update `Brewfile` after installing something new:

```bash
brew bundle dump --file="$(chezmoi source-path)/Brewfile" --force --no-vscode
```
