export ZPLUG_HOME=/opt/homebrew/opt/zplug
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
source $ZPLUG_HOME/init.zsh

# テーマ
zplug "themes/frisk", from:oh-my-zsh

# 簡単にgitリポジトリのルートへcdする
zplug "mollifier/cd-gitroot"

zplug "b4b4r07/enhancd", use:init.sh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf

zplug "tcnksm/docker-alias", use:zshrc, as:plugin

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -lhAG'
alias cp='cp -i'
alias mv='mv -i'
alias g='git'
alias gt='git tree'
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
