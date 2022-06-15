# Set homebrew's PATH for M1 mac
if [[ $(arch) == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
