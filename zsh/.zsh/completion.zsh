zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

autoload -U compinit; compinit
_comp_options+=(globdots)

# zstyle
zstyle ':completion:*' completer _extensions _complete _approximate

# cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

# menu
zstyle ':completion:*' menu select

zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# group
zstyle ':completion:*' group-name ''

zstyle ':completion:*' file-list all

# color
zstyle ':completion:*:default' list-colors ${LS_COLORS}

# sort
zstyle ':completion:*' file-sort modification
