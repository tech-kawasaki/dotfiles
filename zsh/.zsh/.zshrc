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

# +-----+
# | Fzf |
# +-----+
source $ZDOTDIR/fzf_scripts.zsh
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

# +------+
# | asdf |
# +------+
source $(brew --prefix asdf)/libexec/asdf.sh
source $(brew --prefix)/share/zsh/site-functions

# +------------------+
# | Dotfiles checker |
# +------------------+
if test -n "$(git -C ${DOTDIR} status --porcelain)" ||
   ! git -C ${DOTDIR} diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[36m=== DOTFILES IS DIRTY ===\e[m"
  echo -e "\e[33mThe dotfiles have been changed.\e[m"
  echo -e "\e[33mPlease update them with the following command.\e[m"
  echo "  cd ${DOTDIR}"
  echo "  git add ."
  echo "  git commit -m \"update dotfiles\""
  echo "  git push origin main"
  echo -e "\e[36m=========================\e[m"
fi
