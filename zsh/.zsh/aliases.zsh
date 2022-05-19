# ls
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -lhAG'
alias cp='cp -i'
alias mv='mv -i'

# git
alias g='git'
alias gf= 'g fetch'
alias gt="git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"
alias gta='gt --all'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gsb='git status -b'
alias gb='git branch'
alias gm='git merge'
alias ga='git add'
alias gaa='git add .'
alias gpush='git push'
alias gpull='git pull'

#docker
alias dc='docker container'
alias d-c='docker compose'
alias di='docker image'
alias dv='docker volume'

# coteditor
alias cot="open $HOME/coteditor/*"

# dirs
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index