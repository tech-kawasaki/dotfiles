# completion
autoload -Uz compinit && compinit

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

fpath=(${ZDOTDIR}/zsh/plugin/zsh-completions/src $fpath)

# prompt
source $ZDOTDIR/prompt

# alias
source $ZDOTDIR/aliases

# completion
source $ZDOTDIR/completion

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