#!/bin/zsh

# clone repository
DOT_DIR="${HOME}/.dotfiles"
GITHUB_URL="https://github.com/tech-kawasaki/dotfiles.git"

if [[ ! -d ${DOT_DIR} ]]; then
    if ! (( $+commands[git] )); then
        git clone ${GITHUB_URL} ${DOT_DIR}
    else
        echo "git required"
        exit 1
    fi
fi

# xcode
if ! (( $+commands[xcode-select] )); then
    echo "installing xcode-select ..."
    xcode-select --install
fi

# homebrew
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
fi

# symlink
if ! (( $+commands[stow] )); then
    echo "installing GNU Stow ..."
    brew install stow
fi

cd ${DOT_DIR}

echo "make symbolic link ..."
stow zsh git

echo "complete!"
