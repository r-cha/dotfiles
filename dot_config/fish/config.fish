# ─────────────────────────────
# Environment
# ─────────────────────────────
set -gx EDITOR nvim
set -gx CLICOLOR 1
set -gx FZF_DEFAULT_OPTS "--style minimal --layout reverse"
set -gx CONDA_CHANGEPS1 false
set -gx CONDA_AUTO_ACTIVATE_BASE false

# PATH
fish_add_path -g $HOME/.pixi/bin $HOME/miniconda3/bin

# ─────────────────────────────
# History (fish defaults are already good, but match your zsh prefs)
# Fish handles history dedup natively. These tune the size.
# ─────────────────────────────
set -g fish_history_max 50000

# ─────────────────────────────
# Case-insensitive completion — fish does this by default
# Key bindings — fish handles Home/End/Delete/Ctrl+Arrow by default
# Syntax highlighting — built-in
# Autosuggestions — built-in
# ─────────────────────────────

# ─────────────────────────────
# Plugins / integrations
# ─────────────────────────────
zoxide init fish | source
fzf --fish | source
direnv hook fish | source

# ─────────────────────────────
# Aliases
# ─────────────────────────────
alias ll 'ls -al'
alias s 'git status --porcelain'
alias ss 'git status'
alias cdcode 'cd ~/code'

# ─────────────────────────────
# Conda init
# ─────────────────────────────
if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
    source "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
else if command -q conda
    eval (conda shell.fish hook)
end

# Run auto-activate once at startup
_auto_activate_conda
