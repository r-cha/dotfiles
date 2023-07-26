export ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="~/.zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

unsetopt inc_append_history
unsetopt share_history

export EDITOR='nvim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ll='ls -al'
alias line='printf '─%.s' {1..$(tput cols)}'
alias gbdmd="git branch | grep -v "main" | grep -v "develop" | xargs git branch -D"
