export ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="~/.zsh"

unsetopt inc_append_history
unsetopt share_history

# Ignore duplicates from history
setopt HIST_IGNORE_ALL_DUPS

# User configuration
export EDITOR='nvim'

alias ll='ls -al'
alias line='printf '─%.s' {1..$(tput cols)}'
gcap() {
  # git commit all push
  git add --all
  git commit -m "$1"
  git push
}

# opam configuration
[[ ! -r /Users/r-cha/.opam/opam-init/init.zsh ]] || source /Users/r-cha/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Created by `pipx` on 2023-12-15 22:23:48
export PATH="$PATH:/Users/r-cha/.local/bin"
export CLICOLOR=1

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
