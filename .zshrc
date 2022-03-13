export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -lhAG'
alias cp='cp -i'
alias mv='mv -i'
alias g='git'
alias gt="git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"
alias gta='gt --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gs='git status'
alias gsb='git status -b'
alias dc='docker container'
alias d-c='docker compose'
alias di='docker image'
alias dv='docker volume'
alias gb='git branch'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias gm='git merge'
alias cot='open /Users/hirotsugu/coteditor/*'

# 補完の有効化
autoload -Uz compinit && compinit

# passの補完
fpath=( ~/.pass.zsh-completion "${fpath[@]}" )
autoload -Uz .pass.zsh-completion

# prompt
source ~/.dotfiles/prompt