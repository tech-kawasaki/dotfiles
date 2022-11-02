# +----------+
# | Homebrew |
# +----------+
export PATH="/usr/local/sbin:$PATH"

# +------------+
# | Completion |
# +------------+
autoload -Uz compinit && compinit

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

source $ZDOTDIR/completion.zsh

# +---------+
# | Plugins |
# +---------+
fpath=(${ZDOTDIR}/plugins/zsh-completions/src $fpath)
source ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# +--------+
# | Prompt |
# +--------+
source $ZDOTDIR/prompt.zsh

# +-------+
# | Alias |
# +-------+
source $ZDOTDIR/aliases.zsh

# +-------------------+
# | Untracked Setting |
# +-------------------+
[ -f $HOME/.zsh_local ] && source $HOME/.zsh_local

# +-----+
# | Fzf |
# +-----+
source $ZDOTDIR/fzf_scripts.zsh
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

# +-------+
# | Volta |
# +-------+
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# +------------------+
# | Dotfiles checker |
# +------------------+
if test -n "$(git -C ${DOTDIR} status --porcelain)" ||
   ! git -C ${DOTDIR} diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[36m=== DOTFILES IS DIRTY ===\e[m"
  echo -e "\e[33mThe dotfiles have been changed.\e[m"
  echo -e "\e[33mPlease update them with the following command.\e[m"
  echo -e "\e[36m=========================\e[m"
fi

# +----+
# | GO |
# +----+
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# +------+
# | Java |
# +------+
export PATH="$(brew --prefix)/opt/openjdk/bin:$PATH"

# +------------+
# | Doom Emacs |
# +------------+
export PATH="$HOME/.emacs.d/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
