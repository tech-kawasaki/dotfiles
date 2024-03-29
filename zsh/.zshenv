# +-----+
# | Zsh |
# +-----+
export ZDOTDIR="$HOME/.zsh"

# +----------+
# | Dotfiles |
# +----------+
export DOTDIR="$HOME/.dotfiles"

# +-----+
# | Fzf |
# +-----+
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# +------------+
# | Doom Emacs |
# +------------+
export DOOMDIR="$HOME/.doom.d"