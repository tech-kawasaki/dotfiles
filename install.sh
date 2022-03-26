#!/bin/zsh

# +------------------+
# | Clone repository |
# +------------------+
DOTDIR="${HOME}/.dotfiles"
GITHUB_URL="https://github.com/tech-kawasaki/dotfiles.git"

if [[ ! -d ${DOTDIR} ]]; then
    if (( $+commands[git] )); then
        git clone ${GITHUB_URL} ${DOTDIR}
    else
        echo "git required"
        exit 1
    fi
fi

# +-------+
# | Xcode |
# +-------+
if ! (( $+commands[xcode-select] )); then
    echo "installing xcode-select ..."
    xcode-select --install
fi

# +----------+
# | Homebrew |
# +----------+
if ! (( $+commands[brew] )); then
    echo "installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "run brew doctor ..."
    which brew >/dev/null 2>&1 && brew doctor

    echo "run brew update ..."
    which brew >/dev/null 2>&1 && brew update

    echo "run brew upgrade ..."
    brew upgrade

    brew bundle

    brew cleanup

    # Fzf
    $(brew --prefix)/opt/fzf/install
fi

# +---------+
# | Symlink |
# +---------+
if ! (( $+commands[stow] )); then
    echo "installing GNU Stow ..."
    brew install stow
fi

cd ${DOTDIR}

echo "make symbolic link ..."
stow zsh git

echo "complete!"
