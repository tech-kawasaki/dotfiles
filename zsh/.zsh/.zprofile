# M1にHomebrewのpathを通す
if [[ $(arch) == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi