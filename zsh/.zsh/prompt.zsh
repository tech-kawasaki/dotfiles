autoload -Uz add-zsh-hook
autoload -Uz vcs_info 

setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr " %F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr " %F{red}+"
zstyle ':vcs_info:*' formats " %F{green}[%b%c%u%F{green}]%f"
zstyle ':vcs_info:*' actionformats ' %F{green}[%b%f %a%F{green}]%f'

precmd () { vcs_info }

PROMPT=$'%F{blue}%d%f${vcs_info_msg_0_} [%n@%m]
%B%F{black}> %b%f'